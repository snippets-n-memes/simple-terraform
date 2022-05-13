resource "azurerm_resource_group" "rg" {
  count    = var.resource_group_rg
  name     = var.rg_name
  location = var.location
}
