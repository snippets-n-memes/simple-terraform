resource "azurerm_user_assigned_identity" "aks" {
  name = var.identity_name
  location = var.location
  resource_group_name = azurerm_resource_group.rg[0].name
}