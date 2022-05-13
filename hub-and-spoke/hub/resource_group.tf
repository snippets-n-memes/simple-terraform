resource "azurerm_resource_group" "rg" {
  count    = var.resource_group_rg
  name     = var.rg_name
  location = var.location
}

resource "azurerm_resource_group" "rg1" {
  count    = var.resource_group_rg1
  name     = var.rg1_name
  location = var.location
}
