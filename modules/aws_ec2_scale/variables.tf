variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "ami" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "subnet" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}


# ASG policy 
