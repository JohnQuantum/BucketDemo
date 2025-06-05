variable "bucket_name" {
  description = "The name of the GCS bucket."
  type        = string
  default     = "gcp-gsr-newco-demo"
}

variable "project_id" {
  description = "The GCP project ID where the bucket will be created."
  type        = string
  default     = "vaulted-botany-462012-h9"
}

variable "location" {
  description = "The location of the GCS bucket. For Region type, specify the region e.g., US-EAST4."
  type        = string
  default     = "US-EAST4"
}

variable "storage_class" {
  description = "The default storage class for objects in the bucket."
  type        = string
  default     = "STANDARD"
}

variable "public_access_prevention" {
  description = "Controls whether public access is prevented on the bucket. Can be 'enforced' or 'inherited'."
  type        = string
  default     = "enforced"
}

variable "enable_hierarchical_namespace" {
  description = "Whether to enable Hierarchical Namespace for the bucket."
  type        = bool
  default     = false
}