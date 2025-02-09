variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket"
  type        = string
}

variable "route53_domain" {
  description = "Domain name for Route 53"
  type        = string
}

variable "allowed_cidr" {
  description = "CIDR block for inbound traffic"
  type        = string
  default     = "0.0.0.0/0"
}
