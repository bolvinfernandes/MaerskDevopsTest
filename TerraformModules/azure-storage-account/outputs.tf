output "storage-account-id" {
  value = azurerm_storage_account.storage-account.id
}

output "storage-account-name" {
  value = azurerm_storage_account.storage-account.name
}

output "storage-account-primary_key" {
  value = azurerm_storage_account.storage-account.primary_access_key
}
