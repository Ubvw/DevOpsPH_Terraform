resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164"  # Ubuntu 20.04 LTS
  instance_type = "t2.micro"
}