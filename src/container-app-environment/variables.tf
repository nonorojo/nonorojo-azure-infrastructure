variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "nonorojo"
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

variable "subscription_ids" {
  description = "Subscription IDs the GitHub Actions service principal can access"
  type        = list(string)
  default     = ["1776dd90-c1ae-4485-b414-554883c0fa13"]
}

variable "workload_profile_name" {
  description = "The name of the workload profile"
  type        = string
  default     = "Consumption"
}

variable "workload_profile_type" {
  description = "The type of the workload profile"
  type        = string
  default     = "Consumption"
}
