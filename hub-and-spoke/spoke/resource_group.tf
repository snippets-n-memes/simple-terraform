resource "azurerm_resource_group" "rg" {
  count    = var.resource_group_rg
  name     = var.spoke_rg
  location = var.location
}
