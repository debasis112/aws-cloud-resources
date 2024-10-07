# # Application Load Balancer Taget Group
# resource "aws_lb_target_group" "app_tg-01" {
#   name     = "app-tg-01"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc-01.id
# }
