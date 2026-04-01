variable "dynamo_db_table_name" {
  description = "Name of the DynamoDB table to be created"
  type        = string
  default     = "my-dynamodb-table"
}

variable "env" {
    type        = string
    description = "This variable holds the environment value to determine the key pair name"
  
}

  
variable "dynamodb_table_count" {
  type        = number
  description = "This variable holds my DynamoDB table count"
  
}