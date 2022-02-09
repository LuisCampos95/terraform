terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "kt-terraform" {
  bucket = "kt-terraform-luis"
  force_destroy = true

  versioning {
    enabled = true
  }

  tags = {
    Description = "Armazenamento do arquivo do terraform.tfstate"
    ManagedBy   = "Terraform"
    Owner       = "Luis Campos"
    CreatedAt   = "2022-02-05"
  }
}
