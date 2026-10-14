resource "azurerm_container_app_environment" "main" {
  name                = "cae-${var.project_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.container_app_environment.name
  location            = azurerm_resource_group.container_app_environment.location

  # Networking & VNet integration
  # (internal_load_balancer_enabled and zone_redundancy_enabled require infrastructure_subnet_id to be set)
  infrastructure_subnet_id           = null
  infrastructure_resource_group_name = null
  public_network_access              = "Enabled"
  mutual_tls_enabled                 = false

  # Compute / Workload Profile (Consumption tier is default)
  workload_profile {
    name                  = var.workload_profile_name
    workload_profile_type = var.workload_profile_type
  }

  tags = {
    environment = var.environment
  }
}

