
# resource "aws_apprunner_service" "web_app_private" {
#   service_name = "my-private-app"

#   source_configuration {
#     image_repository {
#       image_identifier      = "022499026373.dkr.ecr.us-east-1.amazonaws.com/private-project-work:v1.0.0"  # ECR repo in us-east-1
#       image_repository_type = "ECR"
      
#       image_configuration {
#         runtime_environment_variables = {
#           AWS_DEFAULT_REGION = "ap-south-1"  # Use the region where App Runner is running
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
#     cpu    = "1024"
#     memory = "2048"
#   }
# }


# # Optional: Auto scaling configuration for App Runner service
# resource "aws_apprunner_auto_scaling_configuration" "my_auto_scaling" {
#   auto_scaling_configuration_name = "my-app-scaling-config"

#   max_concurrency = 100
#   min_size        = 1
#   max_size        = 3
# }

# # For Public repo in ECR as Auto deploy cannot done for public
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
