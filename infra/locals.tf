locals {
  # Variável para criação da associação das subnets com o route table
  subnet_ids = { for k, v in aws_subnet.subnet : v.tags.Name => v.id }

  # Tags comuns dos serviços
  common_tags = {
    Project   = "KT AWS com Terraform"
    CreatedAt = "2022-02-05"
    ManagedBy = "Terraform"
    Owner     = "Luis Campos"
  }
}