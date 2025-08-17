DOMAIN=$1 # bcd.dev
DB_HOST="127.0.0.1"
DB_DATABASE="bcd_dev"
DB_USERNAME=$DB_DATABASE
DB_PASSWORD=$DB_DATABASE
PHP_VERSION="8.2"
APP_USER="bcd_dev"
APP_ROOT="/var/www/vhosts/$DOMAIN"
WEBROOT="/var/www/vhosts/$DOMAIN/public"
WEBMASTER_EMAIL="bcdbuddy@outlook.com"
REPO=git@github.com:user/repo.git


# Create swap space
total_ram=$(free -m | grep Mem: | awk '{print $2}')
sudo fallocate -l "${total_ram}M" /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile


apt update
apt upgrade -y

apt-get install -y software-properties-common unattended-upgrades vim zip unzip expect

adduser $APP_USER

mkdir -p /var/www/hosts/$DOMAIN
chown -R $APP_USER /var/www/vhosts/$DOMAIN
login $APP_USER
APP_USER=$USER
# Define again as this is a different bash
ssh-keygen -t rsa -b 4096
cat ~/.ssh/id_rsa.pub
git clone $REPO /var/www/hosts/$DOMAIN

./php/install.sh

./composer/install.sh
./nvm/install.sh

./mysql/install.sh
./mysql/init.sh

./nginx/install.sh
./nginx/laravel.sh
./nginx/permissions.sh

./supervisor.sh
