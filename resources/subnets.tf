# Create a single subnets
# resource "aws_subnet" "subnet-01" {
#   vpc_id            = aws_vpc.vpc-01.id
#   cidr_block        = var.subnet_cidr
#   tags              = var.subnet_tags
#   availability_zone = var.subnet_zone
# }

# For multiple subnets
resource "aws_subnet" "subnet-01" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = element(["ap-south-1a", "ap-south-1b"], count.index)
}