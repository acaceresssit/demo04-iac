data "azurerm_resource_group" "iac" {
    name = var.resource_group_name
  
}


resource "azurerm_kubernetes_cluster" "iac" {
    name                    = var.name
    resource_group_name     = data.azurerm_resource_group.iac.name
    location                = data.azurerm_resource_group.iac.location
    dns_prefix              = var.dns_prefix

    linux_profile {
        admin_username = var.admin_user
        ssh_key {
        key_data = var.ssh_public_key

        }

    }
    default_node_pool {
        name       = "default"
        node_count = var.agent_vm_count
        vm_size    = var.agent_vm_size

    }
    identity {
        type = "SystemAssigned"
    }
    tags = {
        Enviroment = "Develop"

    }


  
}