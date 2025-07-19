provider "azurerm" {
  features {}
  skip_provider_registration = true
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.37"
    }
  }

  required_version = ">= 0.12"
}
