resource "azurerm_resource_group" "rg" {
  name     = "${var.app_name}-${var.environment}-rg"
  location = var.location
}

locals {
  subnet_names = [
    for idx in range(length(var.subnet_prefixes)) :
      "${var.app_name}-${var.environment}-${idx + 1}"
  ]
}

module "vnet" {
  source              = "../../modules/vnet"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vnet_name           = "${var.app_name}-${var.environment}-vnet"

  address_space       = var.address_space
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = local.subnet_names

  tags                = var.tags
}

module "aks" {
  source = "../../modules/aks"

  name                   = "${var.app_name}-${var.environment}-aks"
  dns_prefix             = "${var.app_name}-${var.environment}"
  location               = azurerm_resource_group.rg.location
  resource_group_name    = azurerm_resource_group.rg.name

  default_node_pool_name = "default"
  vm_size                = "Standard_B2s"
  os_sku                 = "AzureLinux"
  node_count             = 1

  subnet_id             = module.vnet.subnet_ids[0]
  kubernetes_version    = "1.33.1"

  service_cidr          = "10.1.0.0/16"
  dns_service_ip        = "10.1.0.10"

  tags = var.tags
}

module "ingress_nginx" {
  source      = "../../helm/ingress-nginx"

  kube_config = module.aks.kube_config

  providers = {
    kubernetes = kubernetes
    helm       = helm
  }
}
