# # Define the task definition with the ACR image
# resource "aws_ecs_task_definition" "web_task-01" {
#   family = "web-task"
#   container_definitions = jsonencode([
#     {
#       name      = "my-container",
#       # image     = "debacrregistry.azurecr.io/project-work:latest",
#       image     = "debasis1999/project-work:latest"
#       cpu       = 512,
#       memory    = 1024, # Container memory is 1024MB
#       essential = true,
#       portMappings = [
#         {
#           containerPort = 80,
#           hostPort      = 80
#         }
#       ]
#     }
#   ])

#   requires_compatibilities = ["FARGATE"]
#   network_mode             = "awsvpc"
#   cpu                      = "512"  # Match the container's CPU or higher
#   memory                   = "1024" # Increase task memory to match container memory (at least 1024MB)
#   execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
# }


# resource "aws_ecs_task_definition" "my_task" {
#   family                   = "my-task"
#   network_mode             = "awsvpc" # Required for Fargate
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = "256" # vCPU units
#   memory                   = "512" # Memory in MiB
#   execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
#   task_role_arn            = aws_iam_role.ecs_task_execution_role.arn

#   container_definitions = jsonencode([{
#     name      = "my-container"
#     image     = "022499026373.dkr.ecr.us-east-1.amazonaws.com/private-project-work:v1.0.0" # Replace with your ECR image
#     essential = true
#     portMappings = [{
#       containerPort = 80 # Change this to your application's port
#       hostPort      = 80
#       protocol      = "tcp"
#     }]
#   }])
# }

# # Reference ecs_execution_role in ECS Task Definition
# resource "aws_ecs_task_definition" "my_task" {
#   family                = "my-task"
#   network_mode          = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                   = "256"
#   memory                = "512"
#   execution_role_arn    = aws_iam_role.ecs_execution_role.arn
#   task_role_arn         = aws_iam_role.ecs_execution_role.arn

#   container_definitions = jsonencode([{
#     name      = "my-container"
#     image     = "022499026373.dkr.ecr.us-east-1.amazonaws.com/private-project-work:v1.0.0" # Update with your ECR image URI
#     essential = true
#     portMappings = [{
#       containerPort = 80
#       hostPort      = 80
#       protocol      = "tcp"
#     }]
#   }])
# }

# 9. Create ECS Task Definition
# 9. Create ECS Task Definition
resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-task"
  network_mode             = "awsvpc"
  requires_compatibilities  = ["FARGATE"]
  cpu                      = "512"  # Increase CPU to 512 (adjust as needed)
  memory                   = "1024" # Increase Memory to 1024 (1 GiB)
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn  # Specify execution role ARN

  container_definitions = jsonencode([{
    name      = "my-container"
    image     = "022499026373.dkr.ecr.us-east-1.amazonaws.com/private-project-work:v1.0.0"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}