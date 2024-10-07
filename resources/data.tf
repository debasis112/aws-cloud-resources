# For specific subnet of name tag
data "aws_subnet" "subnet-01" {

  filter {
    name   = "tag:Name"
    values = ["deb-subnet"]
  }
}

# Data block to fetch existing subnets by name
# data "aws_subnet" "subnet-01" {
#   count = var.subnet_count

#   filter {
#     name   = "tag:Name"
#     values = ["${var.subnet_base_name}-${count.index + 1}"]  # Dynamic subnet name using variable
#   }
# }

# data "aws_secretsmanager_secret_version" "secret-id" {
#   secret_id = aws_secretsmanager_secret.acr_spn_credentials.id
# }
