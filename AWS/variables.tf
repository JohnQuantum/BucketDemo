variable "aws_region" {
  description = "The AWS region where the S3 bucket will be created."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name_prefix" {
  description = "A prefix for the S3 bucket name. A random suffix will be appended to ensure uniqueness."
  type        = string
  default     = "aws-gsr-newco-demo"
}

variable "tags" {
  description = "A map of tags to assign to the S3 bucket."
  type        = map(string)
  default = {
    Environment = "demo"
    IAC         = "Terraform"
    Project     = "NewCo Demo"
  }
}

variable "enable_versioning" {
  description = "Set to true to enable versioning on the S3 bucket."
  type        = bool
  default     = true
}