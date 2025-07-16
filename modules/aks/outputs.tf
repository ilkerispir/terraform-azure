output "aks_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.id
}
