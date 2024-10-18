# # App Runner Connection
# resource "aws_apprunner_connection" "my_connection" {
#   connection_name = "my-private-repo-connection"
#   provider_type   = "ECR"  # Change to "GITHUB" or "BITBUCKET" for those providers if needed
# }

# resource "aws_apprunner_service" "web_app" {
#   service_name = "my-web-app"

#   source_configuration {
#     authentication_configuration {
#       # If you need to provide access to a private repository, add a connection ARN here
#       # connection_arn = "arn:aws:apprunner:connection:..."
#     }

#     image_repository {
#       image_identifier      = data.aws_ecrpublic_image.latest_image.image_uri
#       image_repository_type = "ECR_PUBLIC"
#       image_configuration {
#         port = "80"  # Specify the port your web app listens on
#       }
#     }
#   }

#   instance_configuration {
#     cpu    = "1024"
#     memory = "2048"
#   }

#   auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration.my_auto_scaling.arn

#   tags = {
#     Name = "MyAppRunnerService"
#   }
# }

# # Optional: Auto scaling configuration for App Runner service
# resource "aws_apprunner_auto_scaling_configuration" "my_auto_scaling" {
#   auto_scaling_configuration_name = "my-app-scaling-config"

#   max_concurrency = 100
#   min_size        = 1
#   max_size        = 3
# }

# For Private repo in ECR
resource "aws_apprunner_service" "web_app" {
  service_name = "my-private-web-app"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_ecr_access.arn  # Reference to the IAM role you created
    }

    image_repository {
      image_identifier      = "022499026373.dkr.ecr.us-east-1.amazonaws.com/private-project-work:latest"  # Replace with your ECR image URI
      image_repository_type = "ECR"
      image_configuration {
        port = "80"
      }
    }
  }

  instance_configuration {
    cpu    = "1024"
    memory = "2048"
  }

  # auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration.my_auto_scaling.arn

  tags = {
    Name = "MyAppRunnerService"
  }
}
