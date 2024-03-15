# install for php7.4
#sudo apt install -y apt-transport-https lsb-release ca-certificates
#sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
#sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

# php with some extensions
PHP_VERSION=${1:-'8.2'}
sudo apt-get install -y "php$PHP_VERSION" php$PHP_VERSION-{common,cli,fpm,zip,xml,pdo,mysql,mbstring,tokenizer,ctype,curl,common,curl,gd,intl,sqlite3,xmlrpc,xsl,soap,opcache,readline,xdebug,bcmath}

