# resource "aws_security_group" "subnet" {
#   vpc_id = data.aws_subnet.selected.vpc_id

#   ingress {
#     cidr_blocks = [data.aws_subnet.subnet-01.cidr_block]
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#   }
# }

/////////////////////////////////////////////////////////////////


///////////////////////////////////////////
# Security group for allowing HTTPS (TLS) and all outbound traffic
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-01.id  # Ensure this references a valid VPC
  tags        = var.network_security_group_tags
}

# Ingress rule for allowing HTTPS (TLS) traffic from the internet (0.0.0.0/0)
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"   # Allow traffic from the internet
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  tags              = var.network_security_group_tags
}

# Egress rule for allowing all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"   # Allow outbound traffic to any destination
  ip_protocol       = "-1"          # All protocols and ports
  tags              = var.network_security_group_tags
}
