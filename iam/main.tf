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

# Lê todos os arquivos YAML de repo-permissions/ automaticamente.
# Para adicionar um novo repo, basta criar repo-permissions/<nome>.yml — sem editar este arquivo.
locals {
  repo_configs = {
    for filename in fileset("${path.module}/repo-permissions", "*.yml") :
    trimsuffix(filename, ".yml") => yamldecode(
      file("${path.module}/repo-permissions/${filename}")
    )
  }
}

module "repo_iam" {
  for_each = local.repo_configs

  source            = "./module_repo_iam"
  repo_name         = each.value.repo
  github_org        = var.github_org
  oidc_provider_arn = var.oidc_provider_arn
  permissions       = each.value.permissions
}
