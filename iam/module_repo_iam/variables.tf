variable "repo_name" {
  type        = string
  description = "Full GitHub repo name in org/repo format (e.g. minha-empresa/meu-repo)"
}

variable "github_org" {
  type        = string
  description = "GitHub organization name"
}

variable "oidc_provider_arn" {
  type        = string
  description = "ARN of the GitHub OIDC provider already created in the account"
}

variable "permissions" {
  type = list(object({
    actions   = list(string)
    resources = list(string)
    sid       = optional(string, "")
  }))
  description = "List of permission statements. Each entry maps specific actions to specific resources (no wildcards encouraged)."
}
