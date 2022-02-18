# Output do IP da instância
output "public_ip" {
  value = "http://${aws_instance.this.public_ip}"
}