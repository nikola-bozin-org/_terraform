provider "aws" {
  region = "eu-west-2"
}



//rds = relational database service
resource "aws_db_instance" "my_rds" {
    db_name = "RDS" // name of database in our instance
    identifier = "my-first-rds"  //uniqnue name (reference) for our instance 
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.6.15"
    username = "hidden_username"
    password = "hidden_password"
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true
}