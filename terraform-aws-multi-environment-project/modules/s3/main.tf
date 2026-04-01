resource "aws_s3_bucket" "my_bucket" {
  count = "${var.s3_bucket_name}-${count.index + 1}"
  bucket = var.s3_bucket_name

  tags = {
    Name   = "${var.s3_bucket_name}-${count.index + 1}"
    Environment = var.env
  }
}