# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = "PermanentRG"
      storage_account_name = "mypermanentstorage"
      container_name       = "tfstatefiles"
      key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "uksouth"
}

output "MyResourceGroupValues" {
  value = "Name: ${azurerm_resource_group.example.name} wiht ID: ${azurerm_resource_group.example.id}"
}