# terraform {
#   required_version = "~> 1.9.5"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.68.0"
#     }
#   }
# }

terraform {
  required_version = "~> 1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
    godaddy = {
      source  = "n3integration/godaddy"
      version = "1.9.1"
    }
  }
}