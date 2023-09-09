provider "aws" {
  region = "eu-west-2"
}

variable "ec2_instance_ami" {
  type    = string
  default = "ami-0b1b00f4f0d09d131"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ingress" {
  type    = list(number)
  default = [80, 443]
}

variable "egress" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_instance" "my_ec2_db" {
  ami           = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  tags = {
    Name = "Database Server"
  }
}

resource "aws_security_group" "my_ec2_web_server_security_groups" {
  name = "Allow HTTPS and HTTP"

  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.egress
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "my_ec2_web_server" {
  ami           = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  tags = {
    Name = "Web Server"
  }
  security_groups = [aws_security_group.my_ec2_web_server_security_groups.name]
  user_data = file("web-server-script.sh")
}

resource "aws_eip" "my_ec2_web_server_eip" {
  instance = aws_instance.my_ec2_web_server.id
}



output "my_ec2_db_private_ip_output" {
  value = aws_instance.my_ec2_db.private_ip
}
output "my_ec2_web_server_public_ip_from_eip" {
  value = aws_eip.my_ec2_web_server_eip.public_ip
}
