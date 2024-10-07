# # For specific subnet of name tag
# data "aws_subnet" "subnet-01" {
#   filter {
#     name   = "tag:Name"
#     values = ["deb-subnet-01"]
#   }
# }

# Data block to fetch the created subnets by their tags
data "aws_subnet" "subnet-01" {
  count = var.subnet_count

  filter {
    name   = "tag:Name"
    values = ["${var.subnet_tags["Name"]}-${count.index + 1}"]
  }
}

# data "aws_secretsmanager_secret_version" "secret-id" {
#   secret_id = aws_secretsmanager_secret.acr_spn_credentials.id
# }
