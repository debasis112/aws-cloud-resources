variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "subnet_cidr" {
  description = "CIDR for subnet"
  type        = string
}

variable "subnet_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "network_security_group_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "security_group_id" {}
