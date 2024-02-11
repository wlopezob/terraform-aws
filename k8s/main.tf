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
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}