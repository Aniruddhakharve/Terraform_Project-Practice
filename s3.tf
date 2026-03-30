provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
bucket = "xiamoi-bucket"

  tags = {
    Name   = "xiamoi-bucket"
  }
}