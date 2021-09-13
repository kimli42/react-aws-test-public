terraform {
  required_providers {
    aws = {
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "tf-test-bucket" {
  bucket = "kim-test-bucket-123"
  acl    = "private"
}
