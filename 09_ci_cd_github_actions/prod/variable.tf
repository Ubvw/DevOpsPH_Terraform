variable "instance_count" {
  default = 5
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-011899242bb902164"
}

variable "bucket_prefix" {
  default = "prod-environment-bucket"
}

variable "route53_domain" {
  default = "prod.devopsdeployed.com"
}

variable "allowed_cidr" {
  default = "0.0.0.0/0"
}
