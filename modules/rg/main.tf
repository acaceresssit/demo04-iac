####################ç
# Azure Resource Group
##################
resource "azurerm_resource_group" "iac" {
    name = var.name
    location = var.location
    tags = var.resource_tags
  
}