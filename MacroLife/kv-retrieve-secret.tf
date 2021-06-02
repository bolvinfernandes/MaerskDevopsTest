data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "kvsecret" {
name                  = "AdminPassword" 
key_vault_id          = data.azurerm_key_vault.kv.id
}
output "secret_value" {
  value               = data.azurerm_key_vault_secret.kvsecret.value
  sensitive           = true
}
os_profile {
computer_name         =  var.vm_name
admin_username        =  var.admin_username
admin_password        =  data.azurerm_key_vault_secret.kvsecret.value
}
