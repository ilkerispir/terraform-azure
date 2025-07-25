variable "app_name" {
  description = "The name of the application."
  type        = string
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual network will be created."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network in CIDR format."
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "A list of subnet prefixes in CIDR format."
  type        = list(string)
}

variable "domain_name" {
  description = "The domain name for the DNS zone."
  type        = string
  default     = "azure.ispir.dev"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
