resource "azuread_application" "github_actions" {
  display_name = "github-actions"
}

resource "azuread_service_principal" "github_actions" {
  client_id = azuread_application.github_actions.client_id
}

# Entra federated credentials don't support wildcards (and are capped at 20 per app), so one per repo.
resource "azuread_application_federated_identity_credential" "github_actions" {
  for_each = toset(var.github_repositories)

  application_id = azuread_application.github_actions.id
  display_name   = "${replace(each.value, "/", "-")}-${var.github_branch}"
  description    = "GitHub Actions OIDC for ${each.value}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:${each.value}:ref:refs/heads/${var.github_branch}"
}

resource "azurerm_role_assignment" "github_actions" {
  for_each = toset(var.subscription_ids)

  scope                = "/subscriptions/${each.value}"
  role_definition_name = var.role_definition_name
  principal_id         = azuread_service_principal.github_actions.object_id
}

output "github_actions_client_id" {
  value = azuread_application.github_actions.client_id
}
