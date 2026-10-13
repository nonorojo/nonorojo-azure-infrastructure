resource "azurerm_resource_group" "tfstate" {
  name     = "rg-${var.project_name}"
  location = var.location
}
