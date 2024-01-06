# Install Nginx
dnf install nginx -y

# Copy expense.conf file to /etc/nginx/default.d/expense.conf
cp expense.conf /etc/nginx/default.d/expense.conf

# Remove the default content of nginx web server
rm -rf /usr/share/nginx/html/*

# Download the frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

# Extract the frontend content.
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

# Restart and enable Nginx Service to load the changes of the configuration.
systemctl enable nginx
systemctl restart nginx
