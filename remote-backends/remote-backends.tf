#s3
resource "aws_s3_bucket" "my_bucket_backendname" {
    bucket = "my-terraform-backend-bucket-dhurandaar"  

    tags = {
      Name = "my-terraform-backend-bucket-dhurandaar"
    }
}

#Dynamo DB
resource "aws_dynamodb_table" "my_terraform_backend_lock_table" {
  name           = "my-terraform-backend-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}