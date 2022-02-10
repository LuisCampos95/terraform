resource "aws_key_pair" "my_key" {
  key_name   = "key teste"
  public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}

resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.my_key.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet["sub_a"].id
  tags                        = merge(local.common_tags, { Name = "Nginx Instance" })
  associate_public_ip_address = true
  user_data                   = "${filebase64("nginx.sh")}"
}