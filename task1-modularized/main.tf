provider "aws" {
  region = "eu-west-2"
}

module db {
  source = "./db"
}

module web {
  source = "./web"
}

output "my_ec2_db_private_ip_output" {
  value = module.db.my_ec2_db_private_ip_output
}
output "my_ec2_web_server_public_ip_from_eip" {
  value = module.web.pub_ip
}
