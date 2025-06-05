output "s3_bucket_id" {
  description = "The name (ID) of the S3 bucket."
  value       = aws_s3_bucket.demo_bucket.id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.demo_bucket.arn
}

output "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket."
  value       = aws_s3_bucket.demo_bucket.bucket_domain_name
}

output "s3_bucket_region" {
  description = "The AWS region where the S3 bucket resides."
  value       = aws_s3_bucket.demo_bucket.region
}