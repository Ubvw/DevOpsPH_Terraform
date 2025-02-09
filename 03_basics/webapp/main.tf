# Create EC2 instance 1
resource "aws_instance" "instance_1" {
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer-1"
  }
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World 1" > index.html
    python3 -m http.server 8080 &
  EOF
}

# Create EC2 instance 2
resource "aws_instance" "instance_2" {
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer-2"
  }
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World 2" > index.html
    python3 -m http.server 8080 &
  EOF
}

# Create an S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = "devops-web-app-data"
  force_destroy = true
}

# Create a Security Group for EC2
resource "aws_security_group" "instances" {
  name = "instance-security-group"
}

# Allow incoming HTTP traffic on port 8080
resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Create a Route 53 DNS record for the EC2 instance
resource "aws_route53_zone" "primary" {
  name = "devopsdeployed.com"
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "devopsdeployed.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.instance_1.private_ip]
}