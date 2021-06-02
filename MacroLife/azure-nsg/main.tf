resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "nsg-rules" {
  for_each                    = local.nsgrules
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.destination_port_range
  source_address_prefix       = each.source_address_prefix
  destination_address_prefix  = each.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
}
