terraform {
    backend "azurerm" {
        resource_group_name = "sfstate"
        storage_account_name = "sfstateiac"
        container_name = "remote-tfstate"
        key = "4nNRJroLEsQlHPJ044HJ3Ho4ytu0CeEtGvcIV5CyQJVYUx8eX6cpkuULia4ni3IvHyKsowkl1cUY+AStimij4A=="
      
    }
  
}