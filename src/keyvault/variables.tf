variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "kvnono"
}

variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The Azure region for deployment"
  type        = string
  default     = "West US 2"
}

variable "container_registry_name" {
  description = "Name of the existing container registry"
  type        = string
  default     = "crnono"
}

variable "container_registry_resource_group_name" {
  description = "Resource group of the existing container registry"
  type        = string
  default     = "rg-crnono"
}
