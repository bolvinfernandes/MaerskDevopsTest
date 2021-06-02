resource "azurerm_virtual_network" "vnet" {
  name                = "${Environment}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = {
    creator       = var.owner
    creation_date = formatdate("MMM DD, YYYY", timestamp())
    environment   = var.environment
    terraform     = true
  }

  lifecycle {
    ignore_changes = [tags["creation_date"], ]
  }
}
