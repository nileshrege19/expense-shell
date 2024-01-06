# Install Nginx
dnf install nginx -y

# Start & Enable Nginx service
systemctl enable nginx
systemctl start nginx

# Remove the default content of nginx web server
rm -rf /usr/share/nginx/html/*

# Download the frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

# Extract the frontend content.
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

# Restart Nginx Service to load the changes of the configuration.
systemctl restart nginx
