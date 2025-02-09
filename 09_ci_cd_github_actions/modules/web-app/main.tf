# Create EC2 instances
resource "aws_instance" "instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "WebServer-${count.index + 1}"
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World ${count.index + 1}" > index.html
    python3 -m http.server 8080 &
  EOF
}

# S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_prefix
  force_destroy = true
}

# Security Group
resource "aws_security_group" "instances" {
  name = "instance-security-group"
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = [var.allowed_cidr]
}

# Route 53 Zone and Record
resource "aws_route53_zone" "primary" {
  name = var.route53_domain
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.route53_domain
  type    = "A"
  ttl     = 300
  records = [aws_instance.instances[0].private_ip]
}
