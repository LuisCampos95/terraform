#!/bin/bash
sudo yum install nginx -y
sudo systemctl enable nginx
sudo service nginx start
sudo service nginx status