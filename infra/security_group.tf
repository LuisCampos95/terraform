# Criação do Security Group
resource "aws_security_group" "sg" {
  name        = "SG Terraform"
  description = "Allow public inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  tags        = merge(local.common_tags, { Name = "SG Terraform" })
  # Habilitando portas de entrada
  ingress {
    from_port   = 80 #HTTP
    to_port     = 80 #HTTP
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Liberando todos os IPs
  }
  # Habilitando portas de entrada
  ingress {
    from_port   = 22 #SSH
    to_port     = 22 #SSH
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Liberando todos os IPs
  }
  # Habilitando portas de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #Liberando todos os IPs
  }
}