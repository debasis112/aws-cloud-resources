# output "vpc_id" {
#   value = aws_vpc.vpc-01.id
# }

# output "subnet_id" {
#   value = data.aws_subnet.subnet-01.id
# }

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
