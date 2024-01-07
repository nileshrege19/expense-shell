# Disable default Nodejs and install nodejs version 18
dnf module disable nodejs -y
dnf module enable nodejs:18 -y

dnf install nodejs -y

# Create user
useradd expense

#create folder and delete existing data from the folder if any
rm -rf /app
mkdir /app

# Download the application content to the app flder
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip

# install application
cd /app
npm install

# Reload daemon
systemctl daemon-reload

# Start the service
systemctl enable backend
systemctl start backend

# install mysql client
dnf install mysql -y

# Load schema
mysql -h 172.31.38.3 -uroot -pExpenseApp@1 < /app/schema/backend.sql