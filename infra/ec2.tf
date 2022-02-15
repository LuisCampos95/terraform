# Criação da key pair
resource "aws_key_pair" "my_key" {
  key_name   = "key teste"
  public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}

module "aws_instance_ec2" {
  source                 = "./module_ec2"
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = aws_subnet.subnet["sub_a"].id
  user_data              = file("nginx.sh")
}