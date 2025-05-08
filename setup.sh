#!/bin/bash
sudo dnf update -y
sudo dnf install httpd -y
sudo mkdir -p /var/www/html
sudo rm -rf /var/www/html/*
if sudo cp -r /static-resume-main/* /var/www/html/; then
    echo "Successfully copied website files"
else
    echo "Failed to copy website files" >&2
    exit 1
fi
sudo chown -R apache:apache /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;
sudo systemctl start httpd
sudo systemctl enable httpd
if ! systemctl is-active --quiet httpd; then
    echo "Apache failed to start!" >&2
    exit 1
fi