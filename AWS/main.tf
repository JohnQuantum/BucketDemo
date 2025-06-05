terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
    }
  }
}

provider "aws" {
  region = var.aws_region
  profile = "gsrnewco"
}

# Define the S3 buckets
resource "aws_s3_bucket" "demo_buckets" {
  for_each = toset(var.bucket_names)
  
  bucket = each.value
  tags   = var.tags
}

# Enable versioning on the S3 buckets
resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  for_each = aws_s3_bucket.demo_buckets
  
  bucket = each.value.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

# Block all public access by default
resource "aws_s3_bucket_public_access_block" "demo_bucket_public_access_block" {
  for_each = aws_s3_bucket.demo_buckets
  
  bucket = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable server-side encryption by default (AES256)
resource "aws_s3_bucket_server_side_encryption_configuration" "demo_bucket_sse" {
  for_each = aws_s3_bucket.demo_buckets
  
  bucket = each.value.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}