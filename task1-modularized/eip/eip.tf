variable "instanace_id"{
  type = string
}

resource "aws_eip" "my_ec2_web_server_eip" {
  instance = var.instanace_id
}

output "my_ec2_web_server_public_ip_from_eip" {
  value = aws_eip.my_ec2_web_server_eip.public_ip
}
