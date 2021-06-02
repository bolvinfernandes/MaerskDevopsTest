variable "subnet_prefix" {
  type = "list"
  default = [
    {
      ip       = "10.0.1.0/24"
      name     = "subnet-1"
      vm_name  = "VMNode1"
    },
    {
      ip       = "10.0.2.0/24"
      name     = "subnet-2"
      vm_name  = "VMNode2"
    }
   ]
}

resource "azurerm_subnet" "subnet" {
    name = "${lookup(element(var.subnet_prefix, count.index), "name")}"
    count = "${length(var.subnet_prefix)}"
    resource_group_name = var.resource_group_name
    virtual_network_name = module.vnet.virtual_net_name
    address_prefix = "${lookup(element(var.subnet_prefix, count.index), "ip")}"
}


resource "azurerm_virtual_machine" "VM" {
  for_each              = toset(var.subnet_prefix)
  name                  = each.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.network_interface_ids
  vm_size               = var.size

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

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
  os_profile {
    computer_name  = each.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  tags = {
    environment = "development"
  }
}
