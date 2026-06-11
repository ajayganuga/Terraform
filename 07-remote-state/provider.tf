terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
   backend "s3" {
    bucket = "32s-tf-remote-state" # you should have unique bucket name, same bucket should not be used in other repos or tf projects
    key    = "expense-backend-information" # you should have unique keys with in the bucket, same key should not be used in other repos or tf projects
    region = "us-east-1"
    dynamodb_table = "02-state-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}