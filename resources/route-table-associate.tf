# # Route Table association with Subnets 
# resource "aws_route_table_association" "udr_subnet_association" {
#   count          = 2
#   subnet_id      = aws_subnet.subnet-01[0].id
#   route_table_id = aws_route_table.public.id
# }
