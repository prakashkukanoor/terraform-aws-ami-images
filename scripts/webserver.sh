#!/bin/bash

sudo su
sudo yum update -y && yum -y install httpd && systemctl enable httpd && systemctl start httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "Request Handled by $(hostname -f): WEB APPLICATION SERVER" >> /var/www/html/index.html