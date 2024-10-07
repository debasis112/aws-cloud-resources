resource "aws_lb" "app_lb-01" {
  name               = "app-lb-01"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ecs_sg-01.id]
  subnets            = aws_subnet.subnet-01[*].id
}
//
resource "aws_lb_target_group" "app_tg-01" {
  name     = "app-tg-01"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-01.id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb-01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg-01.arn
  }
}
