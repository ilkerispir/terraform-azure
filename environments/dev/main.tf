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

