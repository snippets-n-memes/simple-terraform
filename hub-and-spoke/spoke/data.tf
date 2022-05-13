data "azurerm_virtual_network" "hub" {
  name                = var.hub_vn
  resource_group_name = var.hub_rg
}
