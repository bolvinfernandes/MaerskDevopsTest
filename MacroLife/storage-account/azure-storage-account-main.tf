resource "azurerm_storage_account" "storage-account" {
  location                 = var.location
  name                     = var.name
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  resource_group_name      = var.resource_group_name
  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.ip_rules
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
 }
