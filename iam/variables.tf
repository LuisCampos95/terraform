variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = "luis"
}

variable "github_org" {
  type        = string
  description = "Nome da organização no GitHub (ex: minha-empresa)"
}

variable "oidc_provider_arn" {
  type        = string
  description = "ARN do GitHub OIDC provider. Criado uma única vez na conta AWS."
}
