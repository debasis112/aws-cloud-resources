resource "aws_route_table_association" "udr_subnet_association" {
  count          = 2
  subnet_id      = aws_subnet.subnet-01[count.index].id
  route_table_id = aws_route_table.public.id
}
