resource "azurerm_resource_group" "rg" {
  count    = var.resource_group_rg
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "sa" {
  count                    = var.storage_account_sa
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg[0].name
  location                 = azurerm_resource_group.rg[0].location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
  tags                     = var.tags
}

resource "azurerm_storage_container" "sc" {
  count                 = var.storage_container_sc
  name                  = var.c_name
  storage_account_name  = azurerm_storage_account.sa[0].name
  container_access_type = var.c_access_type
}