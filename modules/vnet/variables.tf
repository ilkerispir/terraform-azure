# variables.tf

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "The address space for the Virtual Network."
  type        = list(string)
}

variable "subnet_names" {
  description = "A list of subnet names."
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "A list of subnet address prefixes."
  type        = list(string)
}

variable "location" {
  description = "The Azure region for the VNet."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}