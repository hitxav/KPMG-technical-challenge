terraform {
  backend "azurerm" {
    resource_group_name  = "IAC"  
    storage_account_name = "terraform"                     
    container_name       = "tfstate"                     
    key                  = "terraform.tfstate"
  }
}