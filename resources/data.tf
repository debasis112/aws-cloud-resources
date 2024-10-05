# For specific subnet of name tag
data "aws_subnet" "subnet-01" {
  filter {
    name   = "tag:Name"
    values = ["deb-subnet-01"]
  }
}
