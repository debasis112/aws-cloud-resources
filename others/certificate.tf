# # Request an ACM certificate
# resource "aws_acm_certificate" "cert-01" {
#   domain_name       = "meditracks.in" # Replace with your actual domain name
#   validation_method = "DNS"           # Use DNS validation

#   subject_alternative_names = [
#     "www.meditracks.in", # Optional: add additional domain names if needed
#   ]

#   tags = var.ssl_cert_tags
# }
