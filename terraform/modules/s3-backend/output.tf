output "aws_s3_bucket_bucket" {
  value = aws_s3_bucket.state.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.tf-state-lock.name
}