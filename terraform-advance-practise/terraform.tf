terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.38.0"
    }
  }
  backend "s3" {
    bucket = "my-terraform-backend-bucket-dhurandaar"
    dynamodb_table = "my-terraform-backend-table"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}