# Create a VPC
# resource "aws_vpc" "vpc-01" {
#   cidr_block = var.vpc_cidr
#   tags       = var.vpc_tags
# }

# Create multiple VPCs
resource "aws_vpc" "vpc" {
  count       = var.vpc_count
  cidr_block  = "10.0.${count.index}.0/16"

  tags = merge(var.vpc_tags, { Name = "deb-vpc-${count.index + 1}" })  # Unique name for each VPC
}
