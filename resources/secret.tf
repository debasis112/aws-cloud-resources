# # Define the secret in AWS Secrets Manager for ACR SPN credentials
# resource "aws_secretsmanager_secret" "acr_spn_credentials" {
#   name = "acr-spn-credentials"
#   tags = var.aws_secret_manager_tags
# }

# # Store the actual Service Principal credentials (client ID and client secret)
# resource "aws_secretsmanager_secret_version" "acr_spn_credentials_version" {
#   secret_id = aws_secretsmanager_secret.acr_spn_credentials.id
#   secret_string = jsonencode({
#     client_id     = var.AZ_ACR_SPN_CLIENT_ID      # Store or retrieve this securely (from var or secrets manager)
#     client_secret = var.AZ_ACR_SPN_CLIENT_SECRET, # Store or retrieve this securely
#     tenant_id     = var.AZ_ACR_SPN_TENANT_ID      # Tenant ID for authentication
#   })
# }

