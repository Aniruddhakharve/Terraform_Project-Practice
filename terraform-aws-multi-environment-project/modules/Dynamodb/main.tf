#Dynamo DB
resource "aws_dynamodb_table" "my_dynamodb_table" {
  name           = var.dynamo_db_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}