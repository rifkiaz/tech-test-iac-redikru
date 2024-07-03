resource "aws_s3_bucket" "main" {
  bucket = ""

  tags = {
    Name = "tech-test-bucket-redikru"
  }
}

output "bucket_arn" {
  value = aws_s3_bucket.main.arn
}
