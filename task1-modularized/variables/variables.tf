variable "ec2_instance_ami" {
  type    = string
  default = "ami-0b1b00f4f0d09d131"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

output "ec2_instance_ami" {
  value = var.ec2_instance_ami
}

output "ec2_instance_type" {
  value = var.ec2_instance_type
}