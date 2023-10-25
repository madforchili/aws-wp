# aws-wp
aws wordpress ec2 instance

## repo
https://github.com/madforchili/aws-wp/

## reference
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress-aml-2023.html


change key permission e.g.
```
chmod 400 myKey.pem

ssh -i "tfkey.pem" ec2-user@ec2-35-165-16-198.us-west-2.compute.amazonaws.com

sudo su

dnf install wget php-mysqlnd httpd php-fpm php-mysqli mariadb105-server php-json php php-devel -y

wget https://wordpress.org/latest.tar.gz

tar -xzf latest.tar.gz

systemctl start mariadb httpd

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html#securing-maria-db 

mysql -u root -p 

CREATE USER 'wordpress-user'@'localhost' IDENTIFIED BY 'vesHe6-sawbyv-fittos';
CREATE DATABASE `wordpress-db`;
GRANT ALL PRIVILEGES ON `wordpress-db`.* TO "wordpress-user"@"localhost";
FLUSH PRIVILEGES;
exit

cp wordpress/wp-config-sample.php wordpress/wp-config.php
vi wordpress/wp-config.php
# do config update

cp -r wordpress/* /var/www/html/
vim /etc/httpd/conf/httpd.conf
```
