terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Or your desired Azure provider version
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Ensure you are logged into Azure CLI (`az login`) or have other authentication methods configured (e.g., Service Principal)
}

# Resource to generate a random suffix for resource names
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# Create an Azure Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name     = "${var.resource_group_name_prefix}-${random_string.suffix.result}"
  location = var.azure_location
  tags     = var.tags
}

# Create an Azure Storage Account
resource "azurerm_storage_account" "demo_storage_account" {
  name                     = "${var.storage_account_name_prefix}${random_string.suffix.result}" # Must be globally unique, lowercase & numbers
  resource_group_name      = azurerm_resource_group.demo_rg.name
  location                 = azurerm_resource_group.demo_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  allow_nested_items_to_be_public = false # Recommended for most cases
  public_network_access_enabled = true    # Allow access during deployment

  blob_properties {
    versioning_enabled = var.enable_blob_versioning
    delete_retention_policy {
      days = 7
    }
  }
  network_rules {
    default_action             = "Allow" # Allow access during deployment
    bypass                     = ["AzureServices"] # Allows Azure services to access
    # ip_rules                   = ["YOUR_PUBLIC_IP_ADDRESS/32"] # Example: to allow your IP
  }

  tags = var.tags
  # Enforce HTTPS traffic only
  https_traffic_only_enabled = true
  min_tls_version           = "TLS1_2"
}

# Create a Storage Container within the Storage Account
resource "azurerm_storage_container" "demo_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.demo_storage_account.name
  container_access_type = "private" # No public access to the container
}