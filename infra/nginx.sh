#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1.12 -y
sudo systemctl start nginx

# sudo apt-get update -y
# sudo apt-get install nginx -y
# sudo systemctl start nginx
# sudo ufw allow 'Nginx HTTP'
# sudo ufw status

# sudo yum install nginx -y
# # sudo systemctl enable nginx
# sudo service nginx start
# sudo service nginx status
