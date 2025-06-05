variable "azure_location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "East US" # You can change this to your preferred region
}

variable "resource_group_name_prefix" {
  description = "Prefix for the Azure Resource Group name. A random suffix will be appended."
  type        = string
  default     = "rg-newco-bucket-demo"
}

variable "storage_account_name_prefix" {
  description = "Prefix for the Azure Storage Account name. Must be globally unique, 3-24 chars, lowercase letters & numbers only. A random suffix will be appended."
  type        = string
  default     = "gsrnewcodemo" # Shortened to fit within 24 char limit with 6-char suffix
}

variable "storage_container_name" {
  description = "Name for the Blob Storage Container (the 'bucket')."
  type        = string
  default     = "demo-container-emea"
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this Storage Account. Valid options are Standard and Premium."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Defines the type of replication to use for this Storage Account. Valid options include LRS, GRS, RAGRS, ZRS."
  type        = string
  default     = "LRS" # Locally-redundant storage
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    Environment = "demo"
    IAC         = "Terraform"
    Project     = "NewCo Demo"
  }
}

variable "enable_blob_versioning" {
  description = "Set to true to enable versioning for blobs in the storage account."
  type        = bool
  default     = true
}