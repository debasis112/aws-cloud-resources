resource "aws_route53_zone" "main" {
  name = "meditracks.in"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.meditracks.in"
  type    = "A"
  alias {
    name                   = aws_lb.app_lb-01.dns_name
    zone_id                = aws_lb.app_lb-01.zone_id
    evaluate_target_health = true
  }
}

# Optionally, set GoDaddy DNS to use Route 53 Nameservers (requires GoDaddy API)
resource "godaddy_domain_record" "www" {
  domain = "meditracks.in"
  name   = "www"
  type   = "A"
  value  = aws_lb.app_lb-01.dns_name
}
