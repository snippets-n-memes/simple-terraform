data "azurerm_subnet" "mgmt" {
  name                  = var.mgmt_sn
  virtual_network_name  = var.hub_vn
  resource_group_name   = var.rg_name

  depends_on = [azurerm_virtual_network.vn]
}