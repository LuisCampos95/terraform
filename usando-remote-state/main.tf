terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }

  backend "s3" {
    bucket  = "kt-terraform-luis"
    key     = "kt/repositorio/terraform.tfstate"
    region  = "us-east-1"
    profile = "luis"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
