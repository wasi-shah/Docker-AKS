resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}




resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = random_pet.rg_name.id
  # Add Tags
  tags = {
    "environment" = "k8sdev-9-vscode"
    "demotag"     = "refreshtest"
    "main-tag"    = "main-value"
    # "portal-tag"  = "this is my value"

  }
}
