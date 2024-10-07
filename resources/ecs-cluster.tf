# # Create an ECS cluster
# resource "aws_ecs_cluster" "web_cluster" {
#   name = "web-cluster-01"
#   tags = merge(var.tags, { Name = "${var.base_name}-ecs-cluster-01" })
# }