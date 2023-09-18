[![GitHub release (latest by date)](https://img.shields.io/github/v/release/KamranBiglari/terraform-aws-route53acm)](https://github.com/KamranBiglari/terraform-aws-route53acm/releases/latest)

# terraform-aws-route53acm
A Terraform module to create an A Record in AWS Route53 and validate ACM

## Usage
```
module "route53acm" {
  source  = "KamranBiglari/route53acm/aws"
  version = "~> 1.0"
  domain = "yourdomain.com"
  endpoint = "apigateway.dev"
  record = {
    type = "CNAME"
    ttl = 60
    records = ["d-1234567890.execute-api.us-east-1.amazonaws.com"]
  }
  tags = {
      Name = "apigateway.dev"
      Environment = "dev"
      Team = "devops"
  }
}
```

## Examples
- https://github.com/KamranBiglari/terraform-aws-route53acm/tree/main/example
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_route53_record.endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Prefix of endpoint name | `string` | n/a | yes |
| <a name="input_record"></a> [record](#input\_record) | Endpoint record | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_arn"></a> [certificate\_arn](#output\_certificate\_arn) | n/a |
| <a name="output_domain"></a> [domain](#output\_domain) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | n/a |
<!-- END_TF_DOCS -->