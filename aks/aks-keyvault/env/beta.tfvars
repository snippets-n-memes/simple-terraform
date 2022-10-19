# Defined Resources
resource_group_rg                = 1
kubernetes_cluster_aks           = 1
kubernetes_cluster_node_pool_app = 1

# Global
location                         = "East US"

# Resource Group
rg_name                          = "dank_aks_csi_kv_beta"

# Kubernetes Cluster AKS
aks_name                         = "aks-dank_beta"
aks_dns_prefix                   = "dank8s2"
aks_sku_tier                     = "Free"
node_resource_group              = "dank_aks_csi_kv_nodes_beta"
aks_k8s_version                  = "1.24.3"
aks_sys_vm_size                  = "Standard_DS2_v2"
aks_sys_node_pool_name           = "system"
aks_sys_node_count               = 1
aks_sys_min_count                = 1
aks_sys_max_count                = 2
aks_max_pods                     = 30
aks_agents_type                  = "VirtualMachineScaleSets"
aks_enable_auto_scaling          = "true"
private_cluster_enabled          = "false"
admin_username                   = "robodank"

# Kubernetes Cluster Node Pool "app"
aks_app_vm_size                  = "Standard_DS2_v2"
aks_app_node_pool_name           = "app"
aks_app_node_count               = 1
aks_app_min_count                = 1
aks_app_max_count                = 3

# Tags
tags = {
    Environment = "Beta"
  }
