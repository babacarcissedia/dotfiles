# install sudo | login as root for this to work
apt install sudo

# dev things 
# sudo apt-get install -y apache2 php mysql
# test configuration
# sudo apachectl configtest

# install for phpPHP_VERSION
sudo apt install apt-transport-https lsb-release ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
sudo apt update 

# php with some extensions
PHP_VERSION=7.3
sudo apt-get install -y "php$PHP_VERSION"  "libapache2-mod-php$PHP_VERSION" "php$PHP_VERSION-common" "php$PHP_VERSION-cli" "php$PHP_VERSION-fpm" "php$PHP_VERSION-zip" "php$PHP_VERSION-xml" "php$PHP_VERSION-pdo" "php$PHP_VERSION-mysql"  "php$PHP_VERSION-mbstring" "php$PHP_VERSION-tokenizer" "php$PHP_VERSION-ctype" "php$PHP_VERSION-curl"  "php$PHP_VERSION-common" "php$PHP_VERSION-curl" "php$PHP_VERSION-gd" "php$PHP_VERSION-intl" "php$PHP_VERSION-sqlite3" "php$PHP_VERSIOn-xmlrpc" "php$PHP_VERSION-xsl" "php$PHP_VERSION-soap" "php$PHP_VERSION-opcache" "php$PHP_VERSION-readline"


a2dismod php$PHP_VERSION # (or your current version) 
# enable new PHP $PHP_VERSION module with
a2enmod "php$PHP_VERSION"

# remove old version 
# sudo apt purge php7.1* # for example



# file explorer
sudo apt install -y pcman-fm
# sudo apt install -y nautilus
# sudo apt install -y thunar thunar-archive-plugin tumbler
sudo apt install -y numix-gtk-theme numix-icon-theme


# install good terminal
# sudo apt install -y gnome-terminal
# sudo apt install hyper

# install mail client
# sudo apt install -y mailspring

# install music player
sudo apt install -y clementine

# ebook and pdf reader
sudo apt install -y evince

# Obs Studio
sudo apt-get install -y ffmpeg
sudo apt-get install -y obs-studio


# utilities
sudo apt install -y vim git fish leafpad curl wget openssh-client openssl

## Install tmux
sudo apt-get install -y tmux

### Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# linux headers to build kernel stuff
sudo apt-get install -y linux-headers-$(uname -r)

# download google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# install lightdm for login screen (greater) [more customizeable]
sudo apt-get install lightdm -Y
#leafpad /etc/lightdm/lightdm-gtk-greeter.conf

# to show system boot time
# systemd-analyze
# with full detail
# systemd-analyze blame
# disable autostart service
# systemctl disable <service>

# custom grub background
# echo 'GRUB_BACKGROUND="/mnt/myfol/pictures/venom/venom2.jpg"' >> /etc/default/grub
## 
# sudo update-grub


# for asia fonts
sudo apt-get install -y fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core

# emoji fonts
sudo apt-get install -y ttf-ancient-fonts ttf-bitstream-vera


## 1. Download the latest version
wget https://github.com/eosrei/emojione-color-font/releases/download/v1.4/EmojiOneColor-SVGinOT-Linux-1.4.tar.gz
## 2. Uncompress the file
tar zxf EmojiOneColor-SVGinOT-Linux-1.4.tar.gz
## 3. Run the installer
cd EmojiOneColor-SVGinOT-Linux-1.4
./install.sh


# for iphone connect on linux
# instruction here: https://gist.github.com/samrocketman/70dff6ebb18004fc37dc5e33c259a0fc

# Add password less sudo user
username=bcdbuddy
useradd $username
usermod -aG sudo $username
echo "$username  ALL=(ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/$username"

# Start wifi hotspot for network "test_bcd" with password ... on "wlo1" interface
# sudo nmcli dev wifi hotspot ifname wlo1 ssid test_bcd password 09869219
