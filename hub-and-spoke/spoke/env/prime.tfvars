# Defined Resources
resource_group_rg                = 1

# Global
location                         = "East US"

# Resource Group
rg_name                          = "spoke"
hub_rg                           = "hub"

# Virtual Network in Hub
hub_vn                           = "vnet-hub"
spoke_vn                         = "vnet-spoke"
address_space                    = ["10.1.0.0/16"]
dns_servers                      = ["10.0.0.4"]


# Subnets
subnets = [
  {
    name           = "aks"
    address_prefix = "10.1.2.0/24"
  }
]

# DNS
private_dns_zone_name            = "privatelink.eastus.azmk8s.io"
link_name                        = "link"