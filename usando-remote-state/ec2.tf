resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}

resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id              = "subnet-07a496873dc4a67b4"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("~/.ssh/id_rsa.pub")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}


  #   user_data = <<-EOF
  #                     #!/bin/bash
  #                     sudo yum update -y
  #                     sudo yum install nginx -y 
  #                     sudo service nginx start
  #                 EOF
  #   tags = {
  #     Name         = "nginx-instance-teste",
  #     created-date = "08-02-2022"
  #   }



# resource "aws_instance" "web" {
#   ami             = var.ami
#   instance_type   = var.instance_type
#   tags = {
#     Name = "EC2 com nginx"
#   }

#   user_data = <<EOF
#     #!/bin/bash
#     sudo apt-get -y update
#     sudo apt-get -y install nginx
#     sudo service nginx start
#                 EOF
# }