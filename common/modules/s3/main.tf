variable "region" {}
variable "environment" {}
variable "bucket_name" {}

provider "aws" {
  region  = var.region
  profile = var.environment
}

resource "aws_s3_bucket" "app" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
  }
}

output "bucket_name" {
  value = aws_s3_bucket.app.bucket
}
