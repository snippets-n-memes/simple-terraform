data "azurerm_subnet" "sn" {
  name                  = var.subnet
  virtual_network_name  = var.vnet
  resource_group_name   = var.vnet_rg
}

data "azurerm_virtual_network" "vn" {
  name                  = var.vnet
  resource_group_name   = var.vnet_rg
}

data "azurerm_private_dns_zone" "dns" {
  name                  = var.private_dns_zone
  resource_group_name   = var.vnet_hub
}
