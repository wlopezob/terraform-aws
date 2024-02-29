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

variable node_count {
  description = "The number of nodes to create"
  type        = number
}


variable arn_certification_manager {
  description = "The ARN of the certification manager"
  type        = string
}

variable region {
  description = "The region to deploy the resources"
  type        = string
}