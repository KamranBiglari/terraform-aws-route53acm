data "aws_route53_zone" "this" {
  name         = "${var.domain}."
  private_zone = false
}

# DEFINE AN ACM 
resource "aws_acm_certificate" "this" {
  domain_name       = "${var.endpoint}.${var.domain}"
  validation_method = "DNS"
  tags              = var.tags
}

# DEFINE A ROUTE 53 FOR DNS VALIDATION OF THE ACM 
resource "aws_route53_record" "this" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  zone_id         = data.aws_route53_zone.this.zone_id
  name            = each.value.name
  type            = each.value.type
  ttl             = 60
  records         = [each.value.record]
}

# ROUTE 53 TO CREATE CNAME RECORD IN ROUTE 53 FOR END-POINT 
resource "aws_route53_record" "endpoint" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${var.endpoint}.${var.domain}"
  type    = var.record.type
  ttl     = var.record.ttl
  records = var.record.records
  depends_on = [
    aws_acm_certificate.this
  ]
}