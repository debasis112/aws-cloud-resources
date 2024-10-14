# # Application Load Balancer Taget Group
# resource "aws_lb_target_group" "app_tg-01" {
#   name     = "app-tg-01"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc-01[0].id
#   tags = merge(var.tags, { Name = "${var.base_name}-lb-tg-01" })
# }

# 6. Create a Target Group
resource "aws_lb_target_group" "ecs_target_group" {
  name     = "ecs-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "ecs-target-group"
  }
}