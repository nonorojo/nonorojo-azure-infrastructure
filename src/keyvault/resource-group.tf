resource "azurerm_resource_group" "keyvault" {
  name     = "rg-${var.project_name}"
  location = var.location
}
