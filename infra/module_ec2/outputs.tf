# Output do IP da instância
output "public_ip" {
  value = "${aws_instance.this.public_ip}"
}