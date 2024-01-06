# Disable the default mysql version
dnf module disable mysql -y

# Copy mysql repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo

# Install MySQL server
dnf install mysql-community-server -y

# Change the default mysql password
mysql_secure_installation --set-root-pass ExpenseApp@1

# Restart and enable mysql service
systemctl enable mysqld
systemctl start mysqld



