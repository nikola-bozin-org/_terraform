provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "my_tf_state_backend" {
  bucket = "tfstate-backend-xfab"

  tags = {
    Name = "S3 TF State Backend"
  }
}

output "aws_s3_bucket_bucket" {
  value = aws_s3_bucket.my_tf_state_backend.bucket
}