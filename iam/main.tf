terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "kt-terraform-luis"
    key    = "kt/iam/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  # Lê o registro central de repos
  repos = yamldecode(file("${path.module}/repos.yml")).repos

  # Para cada repo, carrega o template de permissões do seu tipo
  repo_configs = {
    for repo in local.repos :
    repo.name => {
      repo_name   = repo.name
      permissions = yamldecode(file("${path.module}/policy-templates/${repo.type}.yml")).permissions
    }
  }
}

module "repo_iam" {
  for_each = local.repo_configs

  source            = "./module_repo_iam"
  repo_name         = each.value.repo_name
  github_org        = var.github_org
  oidc_provider_arn = var.oidc_provider_arn
  permissions       = each.value.permissions
}
