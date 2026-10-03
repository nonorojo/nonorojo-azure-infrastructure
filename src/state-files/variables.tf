variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "tfstate"
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

variable "state_storage_account_name" {
  description = "The name of the storage account for storing Terraform state"
  type        = string
  default     = "nonorojotfstate"
}