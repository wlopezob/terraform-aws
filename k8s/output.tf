# output "subnet_cidr_blocks" {
#   value = toset(data.aws_subnets.vpc-id.ids)
# }

output "eks_cluster_name" {
  value = aws_eks_cluster.casino-eks-cluster
}