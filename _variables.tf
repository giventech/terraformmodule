variable "key_name" {
  description = ""
  type        = string
}


variable "tags" {
  type        = map(any)
  description = "List of tags and permission for the ressources"
  default     = {}
}
