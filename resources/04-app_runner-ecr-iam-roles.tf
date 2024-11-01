# Create an IAM role for App Runner
resource "aws_iam_role" "apprunner_ecr_access" {
  name        = "app-runner-ecr-access-role"
  description = "Role for App Runner to access ECR"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "build.apprunner.amazonaws.com"
        }
      }
    ]
  })
}
