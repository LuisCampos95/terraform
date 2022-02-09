locals {
  subnet_ids = { for k, v in aws_subnet.this : v.tags.Name => v.id }

  common_tags = {
    Project   = "KT AWS com Terraform"
    CreatedAt = "2022-02-05"
    ManagedBy = "Terraform"
    Owner     = "Luis Campos"
  }

  ec2_tags = {
    created-date = "08-02-2022"
  }
}