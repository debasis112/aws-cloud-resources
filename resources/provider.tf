# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1" # Mumbai
}

# For ECR we have to use US region as for free tier
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
