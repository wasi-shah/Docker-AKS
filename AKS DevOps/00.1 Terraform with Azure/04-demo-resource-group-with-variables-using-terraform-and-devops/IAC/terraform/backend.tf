terraform {
    backend "azurerm" {
    resource_group_name  = "PermanentRG"
    storage_account_name = "mypermanentstorage"
    container_name       = "04-demo-tfstatefiles"
    key                  = "terraform.tfstate"
  }
}
