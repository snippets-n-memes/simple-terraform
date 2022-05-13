resource "azurerm_private_dns_zone" "dns" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.rg[0].name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name                  = var.link_name
  resource_group_name   = azurerm_resource_group.rg[0].name
  private_dns_zone_name = azurerm_private_dns_zone.dns.name
  virtual_network_id    = data.azurerm_virtual_network.hub.id
}