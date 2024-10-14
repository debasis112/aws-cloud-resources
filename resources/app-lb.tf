# # Application Load Balancer
# resource "aws_lb" "app_lb-01" {
#   name               = "app-lb-01"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = aws_security_group.ecs_sg-01[*].id
#   subnets            = aws_subnet.subnet-01[*].id
#   tags = merge(var.tags, { Name = "${var.base_name}-lb-01" })
# }

# 5. Create Application Load Balancer
resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]  # Use both public subnets

  enable_deletion_protection = false

  tags = {
    Name = "app-load-balancer"
  }
}
