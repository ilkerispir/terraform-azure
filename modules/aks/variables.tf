variable "name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure location where the AKS cluster will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the AKS cluster."
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the Virtual Machines in the default node pool."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "os_sku" {
  description = "The OS SKU to be used for the default node pool. (e.g. 'AzureLinux' or 'Ubuntu')"
  type        = string
  default     = "AzureLinux"
}

variable "subnet_id" {
  description = "The ID of the subnet in which the AKS cluster's default node pool will be deployed."
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version to use for the cluster."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the AKS resources."
  type        = map(string)
  default     = {}
}

variable "network_plugin" {
  description = "Network plugin to use for AKS"
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "Network policy for controlling traffic between pods"
  type        = string
  default     = null
}

variable "network_data_plane" {
  description = "Specifies the data plane used for Kubernetes networking"
  type        = string
  default     = null
}

variable "service_cidr" {
  description = "CIDR for Kubernetes services"
  type        = string
}

variable "dns_service_ip" {
  description = "IP address within the service CIDR for DNS"
  type        = string
}
