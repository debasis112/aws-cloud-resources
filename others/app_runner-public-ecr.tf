# App Runner
# For Public repo in ECR as Auto deploy cannot done for public
# resource "aws_apprunner_service" "web_app_public" {
#   service_name = "my-public-app-public"

#   source_configuration {
#     image_repository {
#       image_identifier      = "public.ecr.aws/l6f8k7r6/public-project-work:v1.0.0"  # Update with your public ECR image URI
#       image_repository_type = "ECR_PUBLIC"  # Specify that this is an ECR Public image
#       image_configuration {
#         port = "80"
#       }
#     }
#   }

#   instance_configuration {
#     cpu    = "1024"
#     memory = "2048"
#   }

#   # auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration.my_auto_scaling.arn

#   tags = {
#     Name = "MyAppRunnerService"
#   }
# }
