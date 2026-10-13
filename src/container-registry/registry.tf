resource "azurerm_container_registry" "main" {
  name                = "${var.project_name}"
  resource_group_name = azurerm_resource_group.tfstate.name
  location            = azurerm_resource_group.tfstate.location
  sku                 = "Basic"
  admin_enabled       = false

  tags = {
    environment = var.environment
  }
}