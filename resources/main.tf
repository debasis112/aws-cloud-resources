# Create an ECS cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster-01"
  tags = var.ecs_cluster_tags
}

# Define the task definition with the ACR image
resource "aws_ecs_task_definition" "ecs_task" {
  family = "ecs-task"
  container_definitions = jsonencode([
    {
      name      = "my-container",
      image     = "debacrregistry.azurecr.io/project-work:latest", # ACR Image
      cpu       = 512,
      memory    = 1024,
      essential = true,
      portMappings = [
        {
          containerPort = 80,
          hostPort      = 80
        }
      ]
    }
  ])

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
}

# Define an ECS service to run the task
resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets          = ["subnet-02be7fb92e519a0b5"] # Replace with your AWS subnets
    assign_public_ip = true
  }
}

# IAM Role for ECS tasks to pull from ACR
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2024-10-06",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

# IAM policy for ECS task execution to pull images
resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
