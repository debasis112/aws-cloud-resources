# For specific subnet of name tag
data "aws_subnet" "subnet-01" {
  filter {
    name   = "tag:Name"
    values = ["deb-subnet-01"]
  }
}

data "aws_security_group" "allow_tls" {
  id = var.security_group_id
}