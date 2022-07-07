#########################
#Azure resoruce provider
#########################
provider "azurerm" {
  version = "=2.36.0"
  features {}
}

##############################
# Azure Resource Group for AKS
##############################
module "resource_group" {
  source = "./modules/rg"

  name = var.resource_group_name
  location = var.location
  resource_tags  = {
    Enviroment = "Develop"
  }
  
}

########################3#####
#Private key RSA  for AKS
###############################
resource "tls_private_key" "iac" {
  algorithm = "RSA"

}

/*#####################################
#Private Key  Save Local
#####################################
resource "null_resource" "iac" {
  triggers = {
    key = tls_private_key.iac.private_key_pem
  }

  provisioner "local-exec" {
    command = <<EOF
            mkdir -p ${path.module}/.ssh
            echo "${tls_private_key.iac.private_key_pem}" > ${path.module}/.ssh/id_rsa
            chmod 0600 ${path.module}/.ssh/id_rsa
EOF

  }
}*/

##################
#AKS MODULE INTANCE
#################
module "aks" {
  source = "./modules/aks"
  name = var.cluster_name
  resource_group_name = var.resource_group_name
  dns_prefix = var.dns_prefix
  agent_vm_count  = var.agent_count
  agent_vm_size = "Standard_D2_V2"
  admin_user = var.admin_username
  ssh_public_key = "${trimspace(tls_private_key.iac.public_key_openssh)} ${var.admin_username}@azure.com"
  

  
}

/*
################################
#AKS Cluster 
################################
resource "azurerm_kubernetes_cluster" "iac" {
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.iac.name
  location            = azurerm_resource_group.iac.location
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = "${trimspace(tls_private_key.iac.public_key_openssh)} ${var.admin_username}@azure.com"

    }

  }
  default_node_pool {
    name       = "default"
    node_count = var.agent_count
    vm_size    = "Standard_D2_V2"

  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Enviroment = "Develop"

  }

}

#################################
#Local KUbe Config
#################################

resource "local_file" "cluster_credentials" {
  count             = var.agent_count
  sensitive_content = azurerm_kubernetes_cluster.iac.kube_config_raw
  filename          = "${var.output_directory}/${var.kubeconfig_filename}"
  depends_on = [
    azurerm_kubernetes_cluster.iac
  ]

}


##########################
#Ouput Variables
##########################
output "id" {
  value = azurerm_kubernetes_cluster.iac.id

}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.iac.kube_config_raw
  sensitive = true

}

output "kube_admin_config" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.iac.kube_config

}


*/
