# output "vpc_id" {
#   value = aws_vpc.vpc-01.id
# }

# output "subnet_id" {
#   value = data.aws_subnet.subnet-01.id
# }

# Output the fetched subnet IDs
output "fetched_subnet_ids" {
  value = data.aws_subnet.subnet[*].id
}

# Output the fetched subnet names
output "fetched_subnet_names" {
  value = data.aws_subnet.subnet[*].tags["Name"]
}

# output "sm_secret_id" {
#   value = data.aws_secretsmanager_secret_version.secret-id.secret_id
# }

# Output the DNS validation records needed
output "validation_records" {
  value = aws_acm_certificate.cert-01.domain_validation_options
}

# output "lb_dns" {
#   value = aws_lb.app_lb-01.dns_name
# }
