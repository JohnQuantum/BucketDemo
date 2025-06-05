variable "aws_region" {
  description = "The AWS region where the S3 bucket will be created."
  type        = string
  default     = "us-east-1"
}

variable "bucket_names" {
  description = "List of S3 bucket names to create."
  type        = list(string)
  default     = [
    "aws-gsr-newco-demo-americas",
    "aws-gsr-newco-demo-global"
  ]
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