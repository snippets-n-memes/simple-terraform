data "azurerm_virtual_network" "hub" {
  name                = var.hub_vn
  resource_group_name = var.hub_rg
}

data "azurerm_private_dns_zone" "dns" {
  name                = var.private_dns_zone_name
  resource_group_name = var.hub_rg
}
