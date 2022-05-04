resource "azurerm_resource_group" "rg" {
  count    = var.resource_group_rg
  name     = var.rg_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  count                   = var.kubernetes_cluster_aks
  name                    = var.aks_name
  location                = azurerm_resource_group.rg[0].location
  resource_group_name     = azurerm_resource_group.rg[0].name
  node_resource_group     = var.node_resource_group
  dns_prefix              = var.aks_dns_prefix
  kubernetes_version      = var.aks_kubernetes_version
  sku_tier                = var.aks_sku_tier
  private_cluster_enabled = var.private_cluster_enabled
  
  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = replace(file(var.pub_ssh_key), "\n", "")
    }
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    dns_service_ip         = cidrhost("172.16.0.0/16", 10)
    docker_bridge_cidr     = "170.10.0.1/16"
    service_cidr           = "172.16.0.0/16"
  }

  default_node_pool {
    only_critical_addons_enabled = true 
    name                         = var.aks_sys_node_pool_name
    node_count                   = var.aks_sys_node_count
    vm_size                      = var.aks_sys_vm_size
    orchestrator_version         = var.aks_k8s_version
    max_pods                     = var.aks_max_pods
    min_count                    = var.aks_sys_min_count 
    max_count                    = var.aks_sys_max_count
    enable_auto_scaling          = var.aks_enable_auto_scaling
    type                         = var.aks_agents_type
    vnet_subnet_id               = element(azurerm_virtual_network.vn.subnet.*.id, 0)
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "app" {
  count                 = var.kubernetes_cluster_node_pool_app
  mode                  = "User" 
  name                  = var.aks_app_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks[0].id
  vm_size               = var.aks_app_vm_size
  node_count            = var.aks_app_node_count
  orchestrator_version  = var.aks_kubernetes_version
  max_pods              = var.aks_max_pods
  min_count             = var.aks_app_min_count 
  max_count             = var.aks_app_max_count 
  tags                  = var.tags
  vnet_subnet_id        = element(azurerm_virtual_network.vn.subnet.*.id, 0)
}    
