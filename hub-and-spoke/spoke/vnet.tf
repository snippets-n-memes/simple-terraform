resource "azurerm_virtual_network" "vn" {
  name                = var.spoke_vn
  location            = azurerm_resource_group.rg[0].location
  resource_group_name = azurerm_resource_group.rg[0].name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  dynamic "subnet" {
    for_each var.subnets
    content {
      name           = subnets.value.name
      address_prefix = subnets.value.address_prefix
    }
  }
}

resource "azurerm_virtual_network_peering" "p1" {
  name                      = "spoke2hub"
  resource_group_name       = azurerm_resource_group.rg[0].name
  virtual_network_name      = azurerm_virtual_network.vn.name
  remote_virtual_network_id = data.azurerm_virtual_network.hub.id
}

resource "azurerm_virtual_network_peering" "p2" {
  name                      = "hub2spoke"
  resource_group_name       = var.hub_rg
  virtual_network_name      = var.hub_vn
  remote_virtual_network_id = azurerm_virtual_network.vn.id
}
