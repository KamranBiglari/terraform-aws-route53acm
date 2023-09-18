module "route53acm" {
  source  = "../"
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