terraform {
  required_version = "~> 1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
    godaddy = {
      source  = "n3integration/godaddy"
      version = "1.9.1"
    }
  }
}