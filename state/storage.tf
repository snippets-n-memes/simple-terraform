resource "azurerm_resource_group" "rg" {
  count = 1
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "sa" {
  count = 1
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
  tags                     = var.asa_tags
}

resource "azurerm_storage_container" "container" {
  count = 1
  name                  = var.c_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.c_access_type
}