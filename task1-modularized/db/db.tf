module "variables" {
  source = "../variables"
}

resource "aws_instance" "my_ec2_db" {
  ami           = module.variables.ec2_instance_ami
  instance_type = module.variables.ec2_instance_type
  tags = {
    Name = "Database Server"
  }
}

output "my_ec2_db_private_ip_output" {
  value = aws_instance.my_ec2_db.private_ip
}