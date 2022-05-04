resource "azurerm_resource_group" "rg1" {
  count    = var.resource_group_rg1
  name     = var.rg1_name
  location = var.location
}

resource "azurerm_virtual_network" "vn" {
  name                = "prime-network"
  location            = azurerm_resource_group.rg1[0].location
  resource_group_name = azurerm_resource_group.rg1[0].name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.2.0/24"
  }
}