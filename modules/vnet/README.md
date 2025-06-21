# VNet Module Documentation

This README file provides information about the Virtual Network (VNet) module within the Terraform Azure project. It explains how to use the module, the input variables required, and the outputs generated.

## Overview

The VNet module is designed to create a Virtual Network in Azure. It encapsulates the necessary resources and configurations required to set up a VNet, making it reusable across different environments.

## Usage

To use the VNet module, include it in your Terraform configuration as follows:

```hcl
module "vnet" {
  source              = "../modules/vnet"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

## Input Variables

The following input variables are required for the VNet module:

| Variable Name         | Type          | Description                                           |
|-----------------------|---------------|-------------------------------------------------------|
| `vnet_name`           | string        | The name of the Virtual Network.                      |
| `address_space`       | list(string)  | The address space for the Virtual Network.            |
| `location`            | string        | The Azure region where the VNet will be created.     |
| `resource_group_name` | string        | The name of the resource group where the VNet will be created. |

## Outputs

The VNet module will return the following outputs:

| Output Name         | Description                                           |
|---------------------|-------------------------------------------------------|
| `vnet_id`           | The ID of the created Virtual Network.                |
| `vnet_address_space`| The address space of the created Virtual Network.     |

## Example

Here is an example of how to define the VNet module in your Terraform configuration:

```hcl
module "vnet" {
  source              = "../modules/vnet"
  vnet_name           = "myVNet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "myResourceGroup"
}
```

## Conclusion

This VNet module simplifies the process of creating a Virtual Network in Azure. By using this module, you can ensure consistency and reusability across your Terraform configurations.