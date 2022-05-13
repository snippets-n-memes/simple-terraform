resource "azurerm_role_assignment" "net" {
  scope                = data.azurerm_virtual_network.vn.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.mi.principal_id
}

resource "azurerm_role_assignment" "dns" {
  scope                = data.azurerm_private_dns_zone.dns.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.mi.principal_id
}