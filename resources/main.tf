# Create an ECS cluster
resource "aws_ecs_cluster" "web_cluster" {
  name = "web-cluster-01"
  tags = var.web_cluster_tags
}

# Define the task definition with the ACR image
resource "aws_ecs_task_definition" "web_task-01" {
  family = "web-task"
  container_definitions = jsonencode([
    {
      name      = "my-container",
      image     = "debacrregistry.azurecr.io/project-work:latest",
      cpu       = 512,
      memory    = 1024, # Container memory is 1024MB
      essential = true,
      portMappings = [
        {
          containerPort = 443,
          hostPort      = 443
        }
      ]
    }
  ])

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"  # Match the container's CPU or higher
  memory                   = "1024" # Increase task memory to match container memory (at least 1024MB)
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
}


# Define an ECS service to run the task
resource "aws_ecs_service" "web_service-01" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.web_cluster.id
  task_definition = aws_ecs_task_definition.web_task-01.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.subnet-01[*].id
    assign_public_ip = true
    security_groups  = [aws_security_group.ecs_sg-01.id]

  }
}

# IAM Role for ECS tasks to pull from ACR
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
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
