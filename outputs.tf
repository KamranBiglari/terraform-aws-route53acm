output "fqdn" {
  value = aws_route53_record.endpoint[0].fqdn
}