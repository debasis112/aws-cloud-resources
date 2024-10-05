# Create a VPC
resource "aws_vpc" "vpc-01" {
  cidr_block = var.vpc_cidr
  tags       = var.vpc_tags
}

# Create a subnets
resource "aws_subnet" "subnet-01" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = var.subnet_cidr

  tags = var.subnet_tags
}
