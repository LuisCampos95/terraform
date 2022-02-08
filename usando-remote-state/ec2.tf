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