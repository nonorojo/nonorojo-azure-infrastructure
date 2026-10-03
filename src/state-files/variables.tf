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

variable "subscription_ids" {
  description = "Subscription IDs the GitHub Actions service principal can access"
  type        = list(string)
  default     = ["1776dd90-c1ae-4485-b414-554883c0fa13"]
}

variable "state_storage_account_ids" {
  description = "Resource IDs of Terraform state storage accounts the GitHub Actions service principal reads and writes via Azure AD"
  type        = list(string)
  default     = ["/subscriptions/1776dd90-c1ae-4485-b414-554883c0fa13/resourceGroups/rg-tfstate-dev/providers/Microsoft.Storage/storageAccounts/stdevnonorojotfstate"]
}
