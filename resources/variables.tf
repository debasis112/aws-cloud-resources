variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "nsg_ipv4_cidr" {
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

variable "subnet_zone" {
  description = "Zone for subnet"
  type        = string
}

variable "network_security_group_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "aws_secret_manager_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

# Variables to securely pass in SPN credentials
variable "AZ_ACR_SPN_CLIENT_ID" {
  type = string
}

variable "AZ_ACR_SPN_CLIENT_SECRET" {
  type = string
}

variable "AZ_ACR_SPN_TENANT_ID" {
  type = string
}

variable "web_cluster_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "ssl_cert_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "domain_access_key" {
  type = string
}

variable "domain_secret" {
  type = string
}