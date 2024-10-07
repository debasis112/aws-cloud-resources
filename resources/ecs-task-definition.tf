# # Define the task definition with the ACR image
# resource "aws_ecs_task_definition" "web_task-01" {
#   family = "web-task"
#   container_definitions = jsonencode([
#     {
#       name      = "my-container",
#       image     = "debacrregistry.azurecr.io/project-work:latest",
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