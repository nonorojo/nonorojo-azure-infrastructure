resource "azurerm_resource_group" "container_app_environment" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
}
