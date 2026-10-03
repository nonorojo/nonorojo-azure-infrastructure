variable "subscription_ids" {
  description = "Subscription IDs the GitHub Actions service principal can access"
  type        = list(string)
  default     = []
}

variable "github_repositories" {
  description = "GitHub repositories (owner/name) allowed to authenticate via OIDC"
  type        = list(string)
  default     = ["nonorojo/nonorojo-azure-infrastructure"]

  validation {
    condition     = alltrue([for r in var.github_repositories : can(regex("^[^/]+/[^/]+$", r))])
    error_message = "Each repository must be in owner/name format."
  }
}

variable "github_branch" {
  description = "Branch allowed to authenticate via OIDC"
  type        = string
  default     = "main"
}

variable "role_definition_name" {
  description = "Role assigned on each subscription"
  type        = string
  default     = "Contributor"
}