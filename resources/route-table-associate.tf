# # Route Table association with Subnets 
# resource "aws_route_table_association" "udr_subnet_association" {
#   count          = 2
#   subnet_id      = aws_subnet.subnet-01[0].id
#   route_table_id = aws_route_table.public.id
# }

# 13. Associate the public route table with the public subnets
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}