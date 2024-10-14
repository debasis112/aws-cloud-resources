# # # Define an ECS service to run the task
# # resource "aws_ecs_service" "web_service-01" {
# #   name            = "web-service"
# #   cluster         = aws_ecs_cluster.web_cluster.id
# #   task_definition = aws_ecs_task_definition.my_task.arn
# #   desired_count   = 1
# #   launch_type     = "FARGATE"

# #   network_configuration {
# #     subnets          = aws_subnet.subnet-01[*].id
# #     assign_public_ip = true
# #     security_groups  = aws_security_group.ecs_sg-01[*].id
# #   }
# # }

# # Define an ECS service to run the task
# resource "aws_ecs_service" "web_service-01" {
#   name            = "web-service"
#   cluster         = aws_ecs_cluster.web_cluster.id
#   task_definition = aws_ecs_task_definition.my_task.arn
#   desired_count   = 1
#   launch_type     = "FARGATE"

#   network_configuration {
#     subnets          = ["subnet-0318e1b4d7ac205d3"]
#     assign_public_ip = true
#     security_groups  = ["sg-0ebbb43340283b14d"]
#   }
# }

# 10. Create ECS Service
resource "aws_ecs_service" "web_service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.private_subnet.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
    container_name   = "my-container"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.front_end]
}
