variable "instance_count" {
  default = 2
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-011899242bb902164"
}

variable "bucket_prefix" {
  default = "devops-web-app-data"
}

variable "route53_domain" {
  default = "devopsdeployed.com"
}

variable "allowed_cidr" {
  default = "0.0.0.0/0"
}
