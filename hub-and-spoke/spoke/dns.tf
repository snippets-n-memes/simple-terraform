resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name                  = var.link_name
  resource_group_name   = var.hub_rg
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = azurerm_virtual_network.vn.id
}
