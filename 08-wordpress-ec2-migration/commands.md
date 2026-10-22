```markdown
# Commands Used

## System Update
```bash
sudo apt update && sudo apt upgrade -y
```

## Install LAMP Stack
```bash
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install mysql-server -y
```

## Start and Enable Services
```bash
sudo systemctl start apache2
sudo systemctl start mysql
sudo systemctl enable apache2
sudo systemctl enable mysql
```

## Secure MySQL
```bash
sudo mysql_secure_installation
```

## Download and Deploy WordPress
```bash
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
sudo mv wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo rm /var/www/html/index.html
```

## Database Setup
```bash
sudo mysql -u root -p
```
```sql
CREATE DATABASE wordpress_db;
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

## Configure WordPress
```bash
sudo mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo nano /var/www/html/wp-config.php
sudo systemctl restart apache2
```

## Backup
```bash
sudo mysqldump -u root wordpress_db > wordpress_backup.sql
```
```


