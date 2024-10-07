# Internet Gateway for VPC
resource "aws_internet_gateway" "gateway-01" {
  vpc_id = aws_vpc.vpc-01[*].id
  tags = merge(var.tags, { Name = "${var.base_name}-gw-01" })
}