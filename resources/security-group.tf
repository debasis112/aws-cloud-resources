# # Security Group creation
# resource "aws_security_group" "ecs_sg-01" {
#   vpc_id = aws_vpc.vpc-01.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [var.nsg_ipv4_cidr] # Allow HTTP traffic from anywhere
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = [var.nsg_ipv4_cidr] # Allow all outbound traffic
#   }
# }