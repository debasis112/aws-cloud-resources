# Create a single subnets
# resource "aws_subnet" "subnet-01" {
#   vpc_id            = aws_vpc.vpc-01.id
#   cidr_block        = var.subnet_cidr
#   tags              = var.subnet_tags
#   availability_zone = var.subnet_zone
# }

# # Create two subnets in each VPC
# resource "aws_subnet" "subnet-01" {
#   count             = var.subnet_count * var.vpc_count  # Total subnets across all VPCs
#   vpc_id            = aws_vpc.vpc-01[floor(count.index / var.subnet_count)].id  # Reference the appropriate VPC
#   cidr_block        = "10.${floor(count.index / var.subnet_count)}.${count.index % var.subnet_count}.0/24"
#   availability_zone = element(["ap-south-1a", "ap-south-1b"], count.index % var.subnet_count)

#   # Use tags similar to the previous example
#   tags = merge(var.tags, { Name = "${var.subnet_base_name}-${count.index + 1}" })
# }

# # Create one subnets in each VPC
# resource "aws_subnet" "subnet-01" {
#   count             = var.subnet_count                                         # Total subnets across all VPCs
#   vpc_id            = aws_vpc.vpc-01[floor(count.index / var.subnet_count)].id # Reference the appropriate VPC
#   cidr_block        = "10.${floor(count.index / var.subnet_count)}.${count.index % var.subnet_count}.0/24"
#   availability_zone = element(["ap-south-1a", "ap-south-1b"], count.index % var.subnet_count)

#   # Use tags similar to the previous example
#   tags = merge(var.tags, { Name = "${var.base_name}-subnet-${count.index + 1}" })
# }

# 2. Create Public and Private Subnets
# Create Public Subnet in AZ ap-south-1a
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

# Create Public Subnet in AZ ap-south-1b
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}


resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private-subnet"
  }
}