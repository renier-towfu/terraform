resource "aws_s3_bucket" "products_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "production"
  }
}

resource "aws_s3_bucket_ownership_controls" "products_bucket_ownership" {
  bucket = aws_s3_bucket.products_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "products_bucket_public_access" {
  bucket = aws_s3_bucket.products_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "products_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.products_bucket_ownership,
    aws_s3_bucket_public_access_block.products_bucket_public_access,
  ]

  bucket = aws_s3_bucket.products_bucket.id
  acl    = "public-read"
}
