# Global
location              = "East US"

# Base
rg_name               = "aks_resources"

# AKS
aks_name              = "aks-dank"
aks_dns_prefix        = "dank8s"
node_resource_group   = "node_resources"
aks_k8s_version       = "1.20.7"
aks_sys_vm_size       = "Standard_DS2_v2"
aks_app_vm_size       = "Standard_DS2_v2"
aks_sys_nodepool_name = "system"
aks_sys_node_count    = 1
aks_sys_min_count     = 1 
aks_sys_max_count     = 3 
aks_app_nodepool_name = "app"
aks_app_node_count    = 2
aks_app_min_count     = 1 
aks_app_max_count     = 3 
aks_max_pods          = 30
admin_username        = "robodank"
pub_ssh_key           = "~/.ssh/id_rsa.pub"

# Tags
tags = {system
    Environment = "Production"
  }
