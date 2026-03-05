provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  key_name      = "your-key-name"

  tags = {
    Name = "Ghost-Server-${count.index}"
  }
}

output "public_ips" {
  value = aws_instance.web[*].public_ip
}

