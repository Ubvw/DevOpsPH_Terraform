module "web_app" {
  source           = "./modules/web-app"
  instance_count    = 2
  instance_type     = "t2.micro"
  ami_id            = "ami-011899242bb902164"
  bucket_prefix     = "devops-web-app-data"
  route53_domain    = "devopsdeployed.com"
  allowed_cidr      = "0.0.0.0/0"
}
