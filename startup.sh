#!/bin/bash

# Update package lists
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Configure Nginx to listen on port 80
sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOL
server {
    listen 80 default_server;
    server_name _;
    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOL'

# Restart Nginx to apply the changes
sudo systemctl restart nginx