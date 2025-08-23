resource "aws_acm_certificate" "bharath2103" {
  domain_name       = "bharath2103.site"   # change to your domain
  validation_method = "DNS"

  tags = {
    Name = "${var.project}-${var.environment}-acm"
  }
}