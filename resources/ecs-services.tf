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
    security_groups  = aws_security_group.ecs_sg-01[*].id
  }
}
