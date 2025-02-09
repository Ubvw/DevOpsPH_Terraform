module "web_app" {
  source         = "./modules/web-app"
  instance_count = var.instance_count
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  bucket_prefix  = "${var.bucket_prefix}-${terraform.workspace}"
  route53_domain = var.route53_domain
  allowed_cidr   = var.allowed_cidr
}