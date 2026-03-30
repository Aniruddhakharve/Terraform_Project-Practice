resource "aws_s3_bucket" "my_bucket" {
bucket = "xiamoi-bucket"

  tags = {
    Name   = "xiamoi-bucket"
  }
}