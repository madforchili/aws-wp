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

vesHe6-sawbyv-fittos

define('AUTH_KEY',         'Adl3<pH]<>xQR|-bt^4!=rC-0A=>;>sm(S.&.*^E+=QKT9+_8.WJ|T,FR..-I4K5');
define('SECURE_AUTH_KEY',  'K#Kp/;xF_a6|w%b3!;4@ec+!`t|6 =bBf_!Fr 6[M=:z@R2= aDqUI952DNk;zKd');
define('LOGGED_IN_KEY',    'Hvrig -%c-,K.{#s|Vk@DDS~M|/x6CUm<E|0xJZU|> ;(;wsF:^h8d)B:bz-^7NN');
define('NONCE_KEY',        'fUH+ Cyf~bMn$^;8[W4m4`=-S(k4E+YD._+,0=)~LCIo+A-jI#P+JW$+HmYsib7d');
define('AUTH_SALT',        '^govnLc1tUh,s~BA98pR%-3XL)e%:#+-A.@,@o40q<n5WaX}>]36o;#~w>&y@*3G');
define('SECURE_AUTH_SALT', '1}.|%&`TO|?4#o`/h*3WaA;9Qy9f.4V7TN-Gd.]J=R5o |#q8s,q7eIB5EE%NbFn');
define('LOGGED_IN_SALT',   'UC8<{NN8}Fwpj`|R+(GwU*f^ ?R?+0v$hn8C5||lzJ!=5@QWU->}OwnbmPV=}(0A');
define('NONCE_SALT',       'j!s=D@u)~L39t8X7$DtQ|@]sWrGb9F{A]pW8yzs/<_iVo?a31B9mAci[yj?+m]m/');