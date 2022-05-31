resource "azurerm_private_dns_zone" "dns" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.rg[0].name
}
