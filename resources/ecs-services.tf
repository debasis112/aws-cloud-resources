# # Define an ECS service to run the task
# resource "aws_ecs_service" "web_service-01" {
#   name            = "web-service"
#   cluster         = aws_ecs_cluster.web_cluster.id
#   task_definition = aws_ecs_task_definition.my_task.arn
#   desired_count   = 1
#   launch_type     = "FARGATE"

#   network_configuration {
#     subnets          = aws_subnet.subnet-01[*].id
#     assign_public_ip = true
#     security_groups  = aws_security_group.ecs_sg-01[*].id
#   }
# }

resource "aws_ecs_service" "web_service-01" {
  name            = "web-page-01"
  cluster         = aws_ecs_cluster.web_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 3
  iam_role        = aws_iam_role.ecs_execution_role.arn

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app_tg-01.arn
    container_name   = "web-page"
    container_port   = 8080
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [ap-south-1a, ap-south-1b]"
  }
}
