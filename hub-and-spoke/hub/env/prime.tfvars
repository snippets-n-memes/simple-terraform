# Defined Resources
resource_group_rg                = 1
resource_group_rg1               = 1

# Global
location                         = "East US"

# Resource Group
rg_name                          = "hub"
rg1_name                         = "mgmt"
spoke_rg                         = "spoke"

# Virtual Network in Hub
hub_vn                           = "vnet-hub"
address_space                    = ["10.0.0.0/16"]
dns_servers                      = ["10.0.0.4"]

# Subnets
mgmt_sn                          = "mgmt"
subnets = [
  {
    name           = "mgmt"
    address_prefix = "10.0.2.0/24"
  }
]

# Public IP
public_ip_name                   = "public-ip-dns"
allocation_method                = "Static"

# NIC
nic_name                         = "nic1"
ip_config_name                   = "internal"
private_ip_allocation            = "Static"

# VM
vm_name                          = "pihole"
size                             = "Standard_DS2"
admin_username                   = "azureruser"
pub_ssh_key                      = "~/.ssh/id_rsa.pub"
disk_caching                     = "ReadWrite"
storage_account_type             = "Standard_LRS"
publisher                        = "Canonical"
offer                            = "UbuntuServer"
sku                              = "20.04-LTS"
version                          = "latest"