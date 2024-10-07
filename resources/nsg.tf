# # Security group for allowing HTTPS (TLS) and all outbound traffic
# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.vpc-01.id # Ensure this references a valid VPC
#   tags        = var.network_security_group_tags
# }

# # Ingress rule for allowing HTTPS (TLS) traffic from the internet (0.0.0.0/0)
# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = var.nsg_ipv4_cidr # Allow traffic from the internet
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
#   tags              = var.network_security_group_tags
# }

# # Egress rule for allowing all outbound traffic
# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = var.nsg_ipv4_cidr # Allow outbound traffic to any destination
#   ip_protocol       = "-1"              # All protocols and ports
#   tags              = var.network_security_group_tags
# }

# Security group for the ALB
# resource "aws_security_group" "alb_sg-01" {
#   name        = "alb_sg-01"
#   description = "Allow inbound traffic for ALB"
#   vpc_id      = aws_vpc.vpc-01.id # Ensure this references a valid VPC

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = [var.nsg_ipv4_cidr] # Allow HTTPS traffic from anywhere
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = [var.nsg_ipv4_cidr] # Allow all outbound traffic
#   }
# }

resource "aws_security_group" "ecs_sg-01" {
  vpc_id = aws_vpc.vpc-01.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.nsg_ipv4_cidr] # Allow HTTPS traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.nsg_ipv4_cidr] # Allow all outbound traffic
  }
}
