resource "azurerm_resource_group" "rg" {
  count    = var.resource_group_rg
  name     = var.hub_rg
  location = var.location
  tags     = {}
}

resource "azurerm_resource_group" "rg1" {
  count    = var.resource_group_rg1
  name     = var.mgmt_rg
  location = var.location
  tags     = {}
}
