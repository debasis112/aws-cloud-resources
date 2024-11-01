# # Auto scaling configuration for App Runner service
# resource "aws_apprunner_auto_scaling_configuration" "app_runner_auto_scaling" {
#   auto_scaling_configuration_name = "my-app-scaling-config"

#   max_concurrency = 100
#   min_size        = 1
#   max_size        = 3
# }
