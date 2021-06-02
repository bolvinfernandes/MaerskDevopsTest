#storage-account
variable "location" {}
variable "name" {}
variable "account_replication_type" {}
variable "account_tier" {}
variable "account_kind" {}
variable "resource_group_name" {}
variable "ip_rules" {}
variable "virtual_network_subnet_ids" {}
#vnet
variable "environment" {}
variable "address_space" {}
variable "owner" {}
#nsg
variable "network_security_group_name" {}
variable "direction" {}
variable "priority" {}
variable "protocol" {}
variable "access" {}
variable "source_port_range" {}
variable "destination_port_range" {}
variable "source_address_prefixes" {}
variable "destination_address_prefix" {}
variable "depends-on" {}
#subnet
variable "virtual_network_name" {}
variable "address_prefixes" {}
variable "service_endpoints" {}
#VM-windows
variable "app_id" {}
variable "size" {}
variable "admin_username" {}
variable "admin_password" {}
variable "disk_caching" {}
variable "disk_storage_account_type" {}
variable "image_publisher" {}
variable "image_offer" {}
variable "image_sku" {}
variable "image_version" {}
variable "network_interface_ids" {}
