variable role_arn_cluster {
    type = string
    description = "arm role for eks cluster"
}

variable project_name_prefix {
    type = string
    description = "the prefix of the project name"
}


variable vcp_id {
  description = "The VPC ID"
  type        = string
}
