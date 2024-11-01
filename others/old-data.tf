
# Data source to get the latest image from the ECR Public repository
# data "aws_ecr_image" "ecr_image" {
#   repository_name = "public-project-work"
#   image_tag       = "v1.0.0"
# }

# # For specific subnet of name tag
# data "aws_subnet" "subnet-01" {
#   filter {
#     name   = "tag:Name"
#     values = ["deb-subnet-01"]
#   }
# }

# data "aws_secretsmanager_secret_version" "secret-id" {
#   secret_id = aws_secretsmanager_secret.acr_spn_credentials.id
# }