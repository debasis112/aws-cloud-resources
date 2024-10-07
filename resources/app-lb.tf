# # Application Load Balancer
# resource "aws_lb" "app_lb-01" {
#   name               = "app-lb-01"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = aws_security_group.ecs_sg-01[*].id
#   subnets            = aws_subnet.subnet-01[*].id
#   tags = merge(var.tags, { Name = "${var.base_name}-lb-01" })
# }
