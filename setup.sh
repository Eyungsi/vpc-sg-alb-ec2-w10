#!/bin/bash
sudo dnf update -y
sudo dnf install httpd unzip wget -y
wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
unzip main.zip
sudo rm -rf /var/www/html/*
sudo cp -r static-resume-main/* /var/www/html/
sudo systemctl start httpd
sudo systemctl enable httpd

