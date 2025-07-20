resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.node_count
    vm_size             = var.vm_size
    os_sku              = var.os_sku
    vnet_subnet_id      = var.subnet_id

    upgrade_settings {
      max_surge = "10%"
    }
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    network_data_plane = "azure"
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
