# # Route table creation
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.vpc-01[0].id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gateway-01[0].id
#   }
#   tags = merge(var.tags, { Name = "${var.base_name}-udr-01" })
# }

# 12. Create a route table for the public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}