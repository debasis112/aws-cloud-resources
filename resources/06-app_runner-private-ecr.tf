# # App Runner
# resource "aws_apprunner_service" "web_app_private" {
#   service_name = var.app_runner_service_name

#   source_configuration {
#     image_repository {
#       image_identifier      = var.app_runner_image_identifier # ECR repo in us-east-1
#       image_repository_type = var.app_runner_image_repository_type

#       image_configuration {
#         runtime_environment_variables = {
#           AWS_DEFAULT_REGION = var.app_runner_default_region # Use the region where App Runner is running
#         }
#       }
#     }

#     # Attach the IAM role for cross-region access
#     authentication_configuration {
#       access_role_arn = aws_iam_role.apprunner_ecr_access.arn
#     }

#     auto_deployments_enabled = true
#   }

#   instance_configuration {
#     cpu    = var.app_runner_inst_config_cpu    # 1024
#     memory = var.app_runner_inst_config_memory # 2048
#   }
# }
