# Defined Resources
resource_group_rg           = 1
storage_account_sa          = 1
storage_container_sc        = 1

# Global
location                     = "East US"

# Base
rg_name                      = "primogenial_resources"

# Storage Account
sa_name                      = "unmovedmover1984"
sa_account_tier              = "Standard"
sa_account_replication_type  = "GRS"

# Container
c_name                       = "state"
c_access_type                = "private"

tags = {
    environment = "all",
    dank        = "yes"
  }
