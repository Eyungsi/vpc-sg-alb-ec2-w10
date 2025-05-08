#!/bin/bash
sudo dnf update -y -q
sudo dnf install httpd -y
sudo mkdir -p /var/www/html
sudo rm -rf /var/www/html/*
sudo cp -r /tmp/static-resume-main/* /var/www/html/
sudo chown -R apache:apache /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;
sudo systemctl stop httpd
sudo rm -rf /var/cache/httpd/*
sudo systemctl start httpd
sudo systemctl enable httpd
sudo tee /var/www/html/version.txt <<EOF
DEPLOYMENT_TIMESTAMP: $(date)
COMMIT_HASH: ${GIT_COMMIT:-local}
EOF
