resource "azurerm_resource_group" "container_app_environment" {
  name     = "rg-cae-${var.project_name}-${var.environment}"
  location = var.location
}
