#!/bin/bash

# Script to install aws cli and codedeploy agent
sudo su

# Install aws cli
sudo yum install pip -y
sudo pip install awscli

# Install codedeploy agent
sudo yum update
sudo yum install ruby wget -y
cd /home/ec2-user
wget https://aws-codedeploy-ap-southeast-1.s3.ap-southeast-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo systemctl start codedeploy-agent
sudo systemctl status codedeploy-agent

# install httpd
sudo yum install httpd -y
sudo echo "<h1>Deployed with CodeDeploy: v1.0</h1>" > /var/www/html/index.html
sudo systemctl start httpd; chkconfig httpd on
