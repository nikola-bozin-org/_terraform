module "variables" {
  source = "../variables"
}

module "eip" {
  source = "../eip"
  instanace_id = aws_instance.my_ec2_web_server.id
}

module "sg" {
  source = "../sg"
}

resource "aws_instance" "my_ec2_web_server" {
  ami           = module.variables.ec2_instance_ami
  instance_type = module.variables.ec2_instance_type
  tags = {
    Name = "Web Server"
  }
  security_groups = [module.sg.sg_name]
  user_data = file("./web/web-server-script.sh")
}

output "instance_id"{
  value = aws_instance.my_ec2_web_server.id
}

output "pub_ip" {
  value = module.eip.my_ec2_web_server_public_ip_from_eip
}

