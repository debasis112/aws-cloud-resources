# For specific subnet of name tag
data "aws_subnet" "subnet-01" {
  filter {
    name   = "tag:Name"
    values = ["deb-subnet-01"]
  }
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.acr_spn_credentials_version.id
}
