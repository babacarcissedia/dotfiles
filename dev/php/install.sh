# install for php7.4
#sudo apt install -y apt-transport-https lsb-release ca-certificates
#sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
#sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
#sudo apt update

# php with some extensions
PHP_VERSION=${1:-'7.4'}
sudo apt-get install -y "php$PHP_VERSION"  "libapache2-mod-php$PHP_VERSION" "php$PHP_VERSION-common" "php$PHP_VERSION-cli" "php$PHP_VERSION-fpm" "php$PHP_VERSION-zip" "php$PHP_VERSION-xml" "php$PHP_VERSION-pdo" "php$PHP_VERSION-mysql"  "php$PHP_VERSION-mbstring" "php$PHP_VERSION-tokenizer" "php$PHP_VERSION-ctype" "php$PHP_VERSION-curl"  "php$PHP_VERSION-common" "php$PHP_VERSION-curl" "php$PHP_VERSION-gd" "php$PHP_VERSION-intl" "php$PHP_VERSION-sqlite3" "php$PHP_VERSIOn-xmlrpc" "php$PHP_VERSION-xsl" "php$PHP_VERSION-soap" "php$PHP_VERSION-opcache" "php$PHP_VERSION-readline" "php$PHP_VERSION-xdebug"

