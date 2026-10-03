variable "subscription_ids" {
  description = "Subscription IDs the GitHub Actions service principal can access"
  type        = list(string)
  default     = ["1776dd90-c1ae-4485-b414-554883c0fa13"]
}

variable "github_repositories" {
  description = "GitHub repositories (owner/name) allowed to authenticate via OIDC, with their immutable owner and repository IDs"
  type = map(object({
    owner_id = string
    repo_id  = string
  }))
  default = {
    "nonorojo/nonorojo-azure-infrastructure" = {
      owner_id = "337281692"
      repo_id  = "1402966926"
    }
  }

  validation {
    condition     = alltrue([for r in keys(var.github_repositories) : can(regex("^[^/]+/[^/]+$", r))])
    error_message = "Each repository key must be in owner/name format."
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