# Defined Resources
resource_group_rg                = 1
kubernetes_cluster_aks           = 1
kubernetes_cluster_node_pool_app = 1

# Global
location                         = "East US"

# Resource Group
rg_name                          = "aks_resources"

# Data objects
subnet                           = "aks"
vnet                             = "vnet-spoke"
vnet_rg                          = "spoke"
vnet_hub                         = "hub"
private_dns_zone                 = "privatelink.eastus.azmk8s.io"

# Managed Identity
identity_name                    = "dank-id"

# Kubernetes Cluster AKS
aks_name                         = "aks-dank"
aks_dns_prefix                   = "dank8s"
aks_sku_tier                     = "Free"
node_resource_group              = "node_resources"
aks_k8s_version                  = "1.22.6"
aks_sys_vm_size                  = "Standard_DS2_v2"
aks_sys_node_pool_name           = "system"
aks_sys_node_count               = 1
aks_sys_min_count                = null
aks_sys_max_count                = null
aks_max_pods                     = 30
aks_agents_type                  = "VirtualMachineScaleSets"
aks_enable_auto_scaling          = "false"
private_cluster_enabled          = "true"
admin_username                   = "robodank"
pub_ssh_key                      = "~/.ssh/id_rsa.pub"

# AKS Network
network_plugin                   = "azure"
network_policy                   = "calico"
dns_service_ip                   = "10.2.0.10"
docker_bridge_cidr               = "170.10.0.1/16"
service_cidr                     = "10.2.0.0/24"

# Kubernetes Cluster Node Pool "app"
aks_app_vm_size                  = "Standard_DS2_v2"
aks_app_node_pool_name           = "app"
aks_app_node_count               = 1
aks_app_min_count                = null
aks_app_max_count                = null

# Tags
tags = {
    Environment = "Test"
  }
