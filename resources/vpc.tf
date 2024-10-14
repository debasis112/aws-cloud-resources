# # Create a VPC
# # resource "aws_vpc" "vpc-01" {
# #   cidr_block = var.vpc_cidr
# #   tags       = var.vpc_tags
# # }

# # Create multiple VPCs
# # resource "aws_vpc" "vpc-01" {
# #   count      = var.vpc_count
# #   cidr_block = "10.${count.index}.0.0/16"
# #   # Vary the second octet 10.0.0.0 to 10.0.255.255 giving a total of 65,536 IP addresses in this range.
# #   tags = merge(var.tags, { Name = "${var.base_name}-vpc-${count.index + 1}" }) # Unique name for each VPC
# # }

# # 1. Create a VPC
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "main-vpc"
#   }
# }