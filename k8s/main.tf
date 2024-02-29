data "aws_subnets" "vpc-id" {
  filter {
    name   = "vpc-id"
    values = [var.vcp_id]
  }
}

## Create the EKS cluster
resource "aws_eks_cluster" "casino-eks-cluster" {
  name     = "${var.project_name_prefix}-eks-cluster"
  role_arn = var.role_arn_cluster

  vpc_config {
    subnet_ids = toset(data.aws_subnets.vpc-id.ids)
  }


  access_config {
    authentication_mode                         = "CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }
}



### create role group
resource "aws_iam_role" "casino-role" {
  name = "${var.project_name_prefix}-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "role-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.casino-role.name
}

resource "aws_iam_role_policy_attachment" "role-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.casino-role.name
}

resource "aws_iam_role_policy_attachment" "role-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.casino-role.name
}

### create node group
resource "aws_eks_node_group" "casino-eks-node-group" {
  cluster_name    = aws_eks_cluster.casino-eks-cluster.name
  node_group_name = "${var.project_name_prefix}-eks-node-group"
  version         = aws_eks_cluster.casino-eks-cluster.version
  node_role_arn   = aws_iam_role.casino-role.arn
  subnet_ids      = toset(data.aws_subnets.vpc-id.ids)

  scaling_config {
    desired_size = var.node_count
    max_size     = var.node_count
    min_size     = var.node_count
  }
}

provider "kubernetes" {
  host                   = aws_eks_cluster.casino-eks-cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.casino-eks-cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.casino-eks-cluster.name, 
        "--region", var.region]
    command     = "aws"
  }
}

provider "helm" {
  experiments {
    manifest = true
  }
  kubernetes {
    host                   = aws_eks_cluster.casino-eks-cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.casino-eks-cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.casino-eks-cluster.name, 
        "--region", var.region]
      command     = "aws"
    }
  }
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "example-namespace"
  }
}

resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  #repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "./charts/ingress-nginx-4.10.0"
  namespace  = "ingress"
  create_namespace = true
  timeout = 1200
  version = "4.10.0"

  set {
    name  = "controller.kind"
    value = "DaemonSet"
  }

  set {
    name  = "cluster.enabled"
    value = "true"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }

  set {
    name  = "controller.service.targetPorts.http"
    value = "http"
  }

  set {
    name  = "controller.service.targetPorts.https"
    value = "http"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-cert"
    value = var.arn_certification_manager
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-backend-protocol"
    value = "http"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-ports"
    value = "https"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-connection-idle-timeout"
    value = "3600"
  }
}