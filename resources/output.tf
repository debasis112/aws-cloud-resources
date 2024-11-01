# # Output the IDs of the created VPCs
# output "vpc_ids" {
#   value = aws_vpc.vpc-01[*].id
# }

# # Output the fetched subnet IDs
# output "fetched_subnet_ids" {
#   value = aws_subnet.subnet-01[*].id
# }

# # Output the fetched subnet names
# output "fetched_subnet_names" {
#   value = aws_subnet.subnet-01[*].tags["Name"]
# }

# # output "lb_dns" {
# #   value = aws_lb.app_lb-01.dns_name
# # }

# output "app_runner-service_url" {
#    value = aws_apprunner_service.web_app_private.service_url
# }