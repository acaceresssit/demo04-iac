output "id" {
  value = azurerm_kubernetes_cluster.iac.id
}


output "kube_config" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.iac.kube_config_raw
}
