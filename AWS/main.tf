terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  profile = "gsrnewco"
}

# Resource to generate a random suffix for the bucket name to help ensure uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4 # Creates an 8-character hex string
}

# Define the S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  # Bucket names must be globally unique. We append a random suffix.
  bucket = "${var.bucket_name_prefix}-${random_id.bucket_suffix.hex}"

  tags = var.tags
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  bucket = aws_s3_bucket.demo_bucket.id # Reference the bucket created above

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

# Block all public access by default
resource "aws_s3_bucket_public_access_block" "demo_bucket_public_access_block" {
  bucket = aws_s3_bucket.demo_bucket.id # Reference the bucket created above

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable server-side encryption by default (AES256)
resource "aws_s3_bucket_server_side_encryption_configuration" "demo_bucket_sse" {
  bucket = aws_s3_bucket.demo_bucket.id # Reference the bucket created above

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}