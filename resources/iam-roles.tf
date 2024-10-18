# # IAM Role for ECS tasks to pull from ACR
# resource "aws_iam_role" "ecs_task_execution_role" {
#   name = "ecsTaskExecutionRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Action = "sts:AssumeRole",
#       Effect = "Allow",
#       Principal = {
#         Service = "ecs-tasks.amazonaws.com"
#       }
#     }]
#   })
# }

# # IAM policy for ECS task execution to pull images
# resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }


# resource "aws_iam_policy_attachment" "ecs_execution_policy" {
#   name       = "ecs_execution_policy_attachment"
#   roles      = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }

# resource "aws_iam_policy_attachment" "ecs_loadbalancer_access" {
#   name       = "ecs_lb_access_policy_attachment"
#   roles      = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
# }

# resource "aws_iam_role" "ecs_execution_role" {
#   name = "ecs_execution_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action    = "sts:AssumeRole"
#       Principal = {
#         Service = "ecs-tasks.amazonaws.com"
#       }
#       Effect    = "Allow"
#       Sid       = ""
#     }]
#   })
# }

# resource "aws_iam_policy_attachment" "ecs_execution_policy" {
#   name       = "ecs_execution_policy_attachment"
#   roles      = [aws_iam_role.ecs_execution_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }

# resource "aws_iam_policy_attachment" "ecs_loadbalancer_access" {
#   name       = "ecs_lb_access_policy_attachment"
#   roles      = [aws_iam_role.ecs_execution_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
# }

# # Create IAM Role for ECS Task Execution
# resource "aws_iam_role" "ecs_execution_role" {
#   name = "ecs_task_execution_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Principal = {
#         Service = "ecs-tasks.amazonaws.com"
#       }
#       Effect = "Allow"
#       Sid    = ""
#     }]
#   })
# }

# # Attach the AmazonECSTaskExecutionRolePolicy to the role
# resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
#   role       = aws_iam_role.ecs_execution_role.name
# }


# IAM rule and policy for App run to fatch image from ECR
resource "aws_iam_role" "apprunner_ecr_access" {
  name = "apprunner-ecr-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "apprunner.amazonaws.com"
        }
      }
    ]
  })
}

# # For ECR to pull image from private repo
# resource "aws_iam_role_policy" "apprunner_ecr_access_policy" {
#   role = aws_iam_role.apprunner_ecr_access.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect   = "Allow",
#         Action   = [
#           "ecr:GetDownloadUrlForLayer",
#           "ecr:BatchGetImage",
#           "ecr:BatchCheckLayerAvailability"
#         ],
#         Resource = "arn:aws:ecr:us-east-1:022499026373:repository/private-project-work"
#         # Syntax is arn:aws:ecr:<region>:<account-id>:repository/<repository-name> # Replace with your ECR repository ARN
#       },
#       {
#         Effect   = "Allow",
#         Action   = "ecr:GetAuthorizationToken",
#         Resource = "*"
#       }
#     ]
#   })
# }

# For ECR to pull image from private repo
resource "aws_iam_policy" "ecr_access_policy" {
  name = "AppRunner-ECR-Cross-Region-Policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ],
        Resource = "arn:aws:ecr:us-east-1:022499026373:repository/private-project-work"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# For ECR to pull image from private repo
resource "aws_iam_role_policy_attachment" "apprunner_ecr_access_attach" {
  role       = aws_iam_role.apprunner_ecr_access.name
  policy_arn = aws_iam_policy.ecr_access_policy.arn
}