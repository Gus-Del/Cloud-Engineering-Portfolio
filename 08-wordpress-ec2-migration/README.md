# WordPress Migration to AWS EC2

A hands-on project that migrates a WordPress site onto an AWS EC2 Ubuntu instance. Demonstrates EC2 provisioning, security groups, SSH key authentication, LAMP stack installation (Linux, Apache, MySQL, PHP), WordPress deployment, database configuration, and basic backup.

## Technologies

- AWS EC2
- Ubuntu LTS
- Apache
- MySQL
- PHP
- WordPress
- SSH / .pem key pairs
- Security Groups

## What I Did

- Launched an Ubuntu EC2 instance (t3.micro)
- Created an RSA .pem key pair and connected via SSH
- Configured a security group to allow SSH from my IP and HTTP from the internet
- Updated the system and installed the LAMP stack (Apache, MySQL, PHP)
- Downloaded and extracted the latest WordPress release
- Moved WordPress files into Apache’s document root and set correct permissions
- Created a dedicated MySQL database and user for WordPress
- Configured wp-config.php with the database credentials
- Restarted Apache and removed the default index.html so WordPress loads
- Completed the WordPress installation via the browser
- Created a MySQL database dump as a backup
- Terminated the instance after documenting the work

## Project Structure

08-wordpress-ec2-migration/
├── README.md
├── commands.md
└── screenshots/
├── 01-ssh-login.png
├── 02-wordpress-success.png
├── 03-live-site.png
└── 04-database-dump.png

