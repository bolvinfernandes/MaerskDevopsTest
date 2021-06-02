### Builds a Windows virtual machine
resource "azurerm_windows_virtual_machine" "windows-vm" {
  name                  = var.environment
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = var.network_interface_ids

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.disk_storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

}
