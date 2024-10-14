# Configure the AWS Provider
# provider "aws" {
#   region = "ap-south-1" # Mumbai
# }

# For ECR we have to use US region as for free tier
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

# provider "godaddy" {
#   key    = var.domain_access_key # Optional if you want to automate DNS
#   secret = var.domain_secret     # Optional if you want to automate DNS
# }