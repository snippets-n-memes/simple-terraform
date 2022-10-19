terraform {
  backend "azurerm" {
    resource_group_name  = "primogenial_resources"
    storage_account_name = "unmovedmover1984"
    container_name       = "state"
  }
}
