# # # Application Load Balancer Listener
# # resource "aws_lb_listener" "http" {
# #   load_balancer_arn = aws_lb.app_lb-01.arn
# #   port              = 80
# #   protocol          = "HTTP"

# #   default_action {
# #     type             = "forward"
# #     target_group_arn = aws_lb_target_group.app_tg-01.arn
# #   }
# #   tags = merge(var.tags, { Name = "${var.base_name}-lb-list-01" })
# # }


# # 7. Create Load Balancer Listener
# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.app_lb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecs_target_group.arn
#   }
# }