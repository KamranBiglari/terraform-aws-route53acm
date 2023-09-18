[![GitHub release (latest by date)](https://img.shields.io/github/v/release/KamranBiglari/terraform-aws-route53acm)](https://github.com/KamranBiglari/terraform-aws-route53acm/releases/latest)

# terraform-aws-route53acm
A Terraform module to create an A Record in AWS Route53 and validate ACM

## Usage
```
module "route53acm" {
  source  = "KamranBiglari/route53acm/aws"
  version = "~> 1.0"
  input = "${path.module}/cloudwatch.yaml"
  alarm_name_prefix = "cloudwatch-monitor"
  current_environment = "dev"
  template_data = {
    
  }
  alarm_actions = {
    default = {
      alarm = ""
      ok = ""
    }
  }
}
```

## Examples
- https://github.com/KamranBiglari/terraform-aws-route53acm/tree/main/example