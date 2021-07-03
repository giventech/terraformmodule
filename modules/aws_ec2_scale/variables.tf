variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "ami" {
  description = "The name to use for all the cluster resources"
  type        = string
}


variable "subnet_ids" {
  description = "The Subnet t be used"
  type        = list(string)
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "vpc_id" {
  description = "The virtual private cloud ide "
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity for the ASG"
  type        = number
}

variable "adm_user" {
  description = "adm_user"
  type        = string
}


variable "tags" {
  type        = map(any)
  description = "List of tags and permission for the ressources"
  default     = {}
}

variable "key_name" {
  description = ""
  type        = string
}


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}


# ASG policy 
