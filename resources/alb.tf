resource "aws_lb" "app_lb-01" {
  name               = "app-lb-01"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ecs_sg-01.id]
  subnets            = aws_subnet.subnet-01[*].id
}

resource "aws_lb_target_group" "app_tg-01" {
  name     = "app-tg-01"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = aws_vpc.vpc-01.id
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.app_lb-01.arn
  port              = 443
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg-01.arn
  }
}
