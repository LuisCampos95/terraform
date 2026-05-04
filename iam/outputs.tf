output "repo_roles" {
  description = "Mapa de repo → ARN da role criada"
  value = {
    for k, mod in module.repo_iam : k => mod.role_arn
  }
}
