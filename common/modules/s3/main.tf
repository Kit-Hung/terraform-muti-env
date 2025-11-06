resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.env}-${var.region}-app-bucket"
  tags = {
    Environment = var.env
  }
}
