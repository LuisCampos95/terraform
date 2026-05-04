locals {
  # github-minha-empresa-meu-repo
  role_name = "github-${replace(var.repo_name, "/", "-")}"
}

resource "aws_iam_role" "this" {
  name = local.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = var.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
        }
        # Restringe ao repo exato — nenhum outro repo pode assumir esta role
        StringLike = {
          "token.actions.githubusercontent.com:sub" = "repo:${var.repo_name}:*"
        }
      }
    }]
  })

  tags = {
    ManagedBy  = "Terraform"
    Repository = var.repo_name
    AutomatedBy = "iam-sync"
  }
}

resource "aws_iam_role_policy" "this" {
  for_each = {
    for idx, p in var.permissions :
    (p.sid != "" ? p.sid : "stmt${idx}") => p
  }

  name = "${local.role_name}-${each.key}"
  role = aws_iam_role.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid      = each.key
      Effect   = "Allow"
      Action   = each.value.actions
      Resource = each.value.resources
    }]
  })
}
