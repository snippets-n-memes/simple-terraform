# Defined Resources
resource_group_rg                = 1
resource_group_rg1               = 1

# Global
location                         = "East US"

# Resource Group
hub_rg                           = "hub"
mgmt_rg                          = "mgmt"
spoke_rg                         = "spoke"

# Virtual Network in Hub
hub_vn                           = "vnet-hub"
address_space                    = ["10.0.0.0/16"]
dns_servers                      = ["10.0.0.4","168.63.129.16"]

# DNS
private_dns_zone_name            = "privatelink.eastus.azmk8s.io"
link_name                        = "linktohub"

# Subnets
mgmt_sn                          = "mgmt"
subnets = [
  {
    name           = "mgmt"
    address_prefix = "10.0.0.0/24"
  }
]

# Public IP
public_ip_name                   = "public-ip-dns"
allocation_method                = "Static"

# NIC
nic_name                         = "nic1"
ip_config_name                   = "internal"
private_ip_allocation            = "Static"
private_ip_address               = "10.0.0.4"

# VM
vm_name                          = "pihole"
size                             = "Standard_D2s_v3"
admin_username                   = "azureuser"
pub_ssh_key                      = "~/.ssh/id_rsa.pub"
disk_caching                     = "ReadWrite"
storage_account_type             = "Standard_LRS"
publisher                        = "Canonical"
offer                            = "0001-com-ubuntu-server-focal"
sku                              = "20_04-lts"
img_version                      = "latest"