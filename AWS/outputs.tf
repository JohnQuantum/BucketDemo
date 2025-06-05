output "s3_bucket_ids" {
  description = "The names (IDs) of the S3 buckets."
  value       = { for k, v in aws_s3_bucket.demo_buckets : k => v.id }
}

output "s3_bucket_arns" {
  description = "The ARNs of the S3 buckets."
  value       = { for k, v in aws_s3_bucket.demo_buckets : k => v.arn }
}

output "s3_bucket_domain_names" {
  description = "The domain names of the S3 buckets."
  value       = { for k, v in aws_s3_bucket.demo_buckets : k => v.bucket_domain_name }
}

output "s3_bucket_regions" {
  description = "The AWS regions where the S3 buckets reside."
  value       = { for k, v in aws_s3_bucket.demo_buckets : k => v.region }
}