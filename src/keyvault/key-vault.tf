data "azurerm_client_config" "current" {}

data "azurerm_container_registry" "main" {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_resource_group_name
}

resource "azurerm_resource_group" "keyvault" {
  name     = "rg-${var.project_name}"
  location = var.location
}

resource "azurerm_key_vault" "main" {
  name                       = var.project_name
  resource_group_name        = azurerm_resource_group.keyvault.name
  location                   = azurerm_resource_group.keyvault.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  rbac_authorization_enabled = true
  purge_protection_enabled   = true

  tags = {
    environment = var.environment
  }
}

resource "azurerm_role_assignment" "secrets_officer" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_secret" "acr_username" {
  name         = "container-registry-username"
  value        = data.azurerm_container_registry.main.admin_username
  key_vault_id = azurerm_key_vault.main.id

  depends_on = [azurerm_role_assignment.secrets_officer]
}

resource "azurerm_key_vault_secret" "acr_password" {
  name         = "container-registry-password"
  value        = data.azurerm_container_registry.main.admin_password
  key_vault_id = azurerm_key_vault.main.id

  depends_on = [azurerm_role_assignment.secrets_officer]
}
