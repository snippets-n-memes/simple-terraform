# Defined Resources
resource_group_rg                = 1
kubernetes_cluster_aks           = 1
kubernetes_cluster_node_pool_app = 1

# Global
location                         = "East US"

# Resource Group
rg_name                          = "aks_resources_2"

# Kubernetes Cluster AKS
aks_name                         = "aks-dank-2"
aks_dns_prefix                   = "dank8s"
aks_sku_tier                     = "Free"
node_resource_group              = "node_resources"
aks_k8s_version                  = "1.20.7"
aks_sys_vm_size                  = "Standard_DS2_v2"
aks_sys_node_pool_name           = "system"
aks_sys_node_count               = 1
aks_sys_min_count                = 1
aks_sys_max_count                = 2
aks_max_pods                     = 30
aks_agents_type                  = "VirtualMachineScaleSets"
aks_enable_auto_scaling          = "false"
private_cluster_enabled          = "true"
admin_username                   = "robodank"
pub_ssh_key                      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeu597VZodBbrfxSQA4SFFeALfCJDnSV2G2eZ2rPjvpukao9Wsu1ChpI3hiMLtRTBzdeNlL41K16rgDmmv7QLQlsZfUFeDL4OWMrBsUEuJo+BtjCgU3NHxUHTOphoYrg/yaqD935UMoyCOMmC/Z7N54XlVidKrANWQJRC9rmxB2auWGHdI0YzMCgTDFD7M57nKyvl025HK6FHZ2l9IuVwWaCrv7Pkncs6/d43z8sII1om/oQ6d4yFDrG4thWX0w4pITVSsSZwzUeiqsmSzEiBaQ1EWNKW/4kVZ8lWRRroJQvQk2BEcePAp3SOQShhPRmVqtOgTO4+UVcGSO7fjFXDD daniel@hydra"

# Kubernetes Cluster Node Pool "app"
aks_app_vm_size                  = "Standard_DS2_v2"
aks_app_node_pool_name           = "app"
aks_app_node_count               = 1
aks_app_min_count                = 1
aks_app_max_count                = 3

# Tags
tags = {
    Environment = "Test"
  }
