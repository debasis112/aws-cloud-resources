# Declare variable for Security group
variable "nsg_ipv4_cidr" {
  description = "CIDR for VPC"
  type        = string
}

# Declare variable for vpc counts
variable "vpc_count" {
  description = "Number of VPCs to create"
  type        = number
  default     = 2  # Adjust this value as needed for VPC
}

# Declare variable for subnet counts
variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
  default     = 2  # Adjust this value as needed for subnets
}

# # Declare variable for subnet zone
# variable "subnet_zone" {
#   description = "Zone for subnet"
#   type        = string
# }

# Define a variable for VPC tags
variable "tags" {
  description = "Tags to assign to the VPCs"
  type        = map(string)
  default = {
    Project     = "debasis-project",
    Environment = "Production",
    Department  = "cloud-computing",
    Owner       = "Debasis_Panda",
    Company     = "WIPRO",
    STD_ID      = "2020WA86256",
  }
}

variable "subnet_base_name" {
  description = "Base name for subnets"
  type        = string
  default     = "deb-subnet"  # Change this if need a different base name
}

variable "vpc_base_name" {
  description = "Base name for vpc"
  type        = string
  default     = "deb-vpc"  # Change this if need a different base name
}

variable "network_security_group_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "aws_secret_manager_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "web_cluster_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "ssl_cert_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

# Variables to securely pass Azure ACR SPN credentials
variable "AZ_ACR_SPN_CLIENT_ID" {
  type = string
}

variable "AZ_ACR_SPN_CLIENT_SECRET" {
  type = string
}

variable "AZ_ACR_SPN_TENANT_ID" {
  type = string
}

# Variables to securely pass domain credentials
variable "domain_access_key" {
  type = string
}

variable "domain_secret" {
  type = string
}