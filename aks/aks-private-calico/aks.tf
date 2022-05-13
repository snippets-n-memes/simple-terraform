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
  private_dns_zone_id     = data.azurerm_private_dns_zone.dns.id
  
  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = file(var.pub_ssh_key)
    }
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
    dns_service_ip         = var.dns_service_ip
    docker_bridge_cidr     = var.docker_bridge_cidr
    service_cidr           = var.service_cidr
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
    vnet_subnet_id               = data.azurerm_subnet.sn.id
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.mi.id]
  }

  tags = var.tags

  depends_on = [
    azurerm_role_assignment.dns,
    azurerm_role_assignment.net,
  ]
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
  vnet_subnet_id        = data.azurerm_subnet.sn.id
}    
