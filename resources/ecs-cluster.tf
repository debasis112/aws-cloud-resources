# # 8. Create ECS Cluster
# resource "aws_ecs_cluster" "main" {
#   name = "web-cluster-01"
#   tags = merge(var.tags, { Name = "${var.base_name}-ecs-cluster-01" })
# }
