# Azure Kubernetes Service (AKS) Terraform Module

This module creates an Azure Kubernetes Service (AKS) cluster.

## Inputs

- `name`: The name of the AKS cluster.
- `location`: Azure region for the AKS cluster.
- `resource_group_name`: Name of the resource group.
- `dns_prefix`: DNS prefix for the AKS cluster.
- `default_node_pool_name`: Name of the default node pool.
- `node_count`: Number of nodes in the default node pool.
- `vm_size`: Size of the Virtual Machines in the default node pool.
- `tags`: Tags to assign to the AKS cluster.

## Outputs

- `aks_id`: The ID of the AKS cluster.
- `kube_config`: The kube_config for the AKS cluster.
