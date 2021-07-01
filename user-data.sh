#!/bin/bash
# This script is launch when AWS instance is bootstrapped (script from top to bottom)
# install httpd (Must be on an Linux 2 EC2 instances)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World admzjl2  $(hostname -f)</h1>" > /var/www/html/index.html