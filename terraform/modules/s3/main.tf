
# Create S3 Bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = format("%s-%s-%s-tf-state", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
  tags   = var.common_tags

  lifecycle {
    prevent_destroy = false
  }
}

# S3 Bucket Versioning (Updated)
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Bucket Server-Side Encryption (Updated)
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# DynamoDB Table for State Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = format("%s-%s-%s-tf-state-lock", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.common_tags
}