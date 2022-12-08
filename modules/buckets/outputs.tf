output "lambda_bucket_id" {
  description = "The output of the archive file."
  value       = aws_s3_bucket.lambda.id
}

