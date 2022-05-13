resource "azurerm_virtual_network" "vn" {
  name                = var.hub_vn
  location            = azurerm_resource_group.rg[0].location
  resource_group_name = azurerm_resource_group.rg[0].name
  address_space       = var.address_space
  dns_servers         = azurerm_network_interface.nic.private_ip_address

  dynamic "subnet" {
    for_each var.subnets
    content {
      name           = subnets.value.name
      address_prefix = subnets.value.address_prefix
    }
  }
}
