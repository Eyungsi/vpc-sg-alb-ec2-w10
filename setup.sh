#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x
sudo dnf update -y -q
sudo dnf install httpd unzip wget -y
wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
unzip main.zip
sudo rm -rf /var/www/html/*
sudo cp -r static-resume/* /var/www/html/
sudo systemctl start httpd
sudo systemctl enable httpd

