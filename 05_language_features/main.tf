
#Arguments
resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164"  #  Argument: Specifies the AMI ID
  instance_type = "t2.micro"               #  Argument: Defines the instance type
}


#Expressions
resource "aws_instance" "example" {
  ami           = #var.ami  # ✅ Expression: Uses a variable instead of hardcoding
  instance_type = #var.env == "prod" ? "t3.large" : "t2.micro"  # ✅ Conditional Expression
}
# This makes Terraform dynamic! If var.env is "prod", it uses "t3.large", otherwise "t2.micro".


#Meta-Arguments
#count 
resource "aws_instance" "example" {
  count         = 3  # ✅ Creates 3 instances
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
}

#for_each
variable "server_names" {
  default = ["web1", "web2", "web3"]
}

resource "aws_instance" "example" {
  for_each      = toset(var.server_names)  # ✅ Creates one EC2 per server name
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"
  tags = {
    Name = each.value  # ✅ Assigns a unique name to each instance
  }
}

#depends_on 
resource "aws_db_instance" "database" {
  allocated_storage = 20
  engine            = "postgres"
  instance_class    = "db.t2.micro"
}

resource "aws_instance" "app_server" {
  ami           = "ami-011899242bb902164"
  instance_type = "t2.micro"

  depends_on = [aws_db_instance.database]  #Ensures DB is created first
}

