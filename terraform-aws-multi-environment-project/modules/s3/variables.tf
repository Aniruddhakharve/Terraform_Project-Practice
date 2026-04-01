variable "s3_bucket_name" {
    description = "This variable hold my s3 bucket name"
    type        = string
    default     = "xiamoi-bucket"
  
}

variable "env" {
    type        = string
    description = "This variable holds the environment value to determine the key pair name"
  
}

variable "s3_bucket_count" {
  type        = number
  description = "This variable holds my S3 bucket count"
  
}