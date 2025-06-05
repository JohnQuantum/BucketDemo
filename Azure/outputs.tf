output "resource_group_name" {
  description = "The name of the Azure Resource Group."
  value       = azurerm_resource_group.demo_rg.name
}

output "storage_account_name" {
  description = "The name of the Azure Storage Account."
  value       = azurerm_storage_account.demo_storage_account.name
}

output "storage_container_name" {
  description = "The name of the Azure Storage Container."
  value       = azurerm_storage_container.demo_container.name
}

output "storage_account_primary_blob_endpoint" {
  description = "The primary Blob service endpoint for the Azure Storage Account."
  value       = azurerm_storage_account.demo_storage_account.primary_blob_endpoint
}

output "storage_container_id" {
  description = "The ID of the Azure Storage Container."
  value       = azurerm_storage_container.demo_container.id
}