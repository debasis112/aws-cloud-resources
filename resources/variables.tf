# Declare variable for vpc counts
variable "vpc_count" {
  description = "Number of VPCs to create"
  type        = number
  default     = 1 # Adjust this value as needed for VPC
}

# Declare variable for subnet counts
variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
  default     = 1 # Adjust this value as needed for subnets
}

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
# Define a variable for base name of resources
variable "base_name" {
  description = "Base name for aws resources"
  type        = string
  default     = "deb"  # Change this if need a different base name
}

variable "aws_secret_manager_tags" {
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