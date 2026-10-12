resource "azurerm_resource_group" "tfstate" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
}
