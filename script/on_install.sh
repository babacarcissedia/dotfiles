# install sudo | login as root for this to work
apt install sudo

# utilities
sudo apt install -y xclip vim nano git fish leafpad curl wget openssh-client openssl stacer ulauncher


## MySQL
sudo apt-get install -y nginx mysql-server mysql-client

# Purge apache2 so that nginx can take over
sudo apt-get purge apache2* -y

## Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
### Docker post install config
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker # activate the group changes



## Git
git config --global user.email bcdbuddy@outlook.com
git config --global user.name "Babacar Cissé DIA"


# test configuration
# nginx -t


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
sudo apt-get install -y ffmpeg obs-studio

## Install tmux
sudo apt-get install -y tmux

### Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/dotfiles/tmux/dev ~/.tmux/

## Tmux - Configuration
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux ~/tmux
# Install tmux manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Reload TMUX environment so TPM is sourced:
tmux source ~/.tmux.conf
# Press prefix + I (capital i, as in Install) to fetch the plugin.


# linux headers to build kernel stuff
sudo apt-get install -y linux-headers-$(uname -r)

# download google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# install lightdm for login screen (greater) [more customizeable]
sudo apt-get install -y lightdm
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

curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install -y ./keybase_amd64.deb
run_keybase


# for asia fonts
sudo apt-get install -y fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core

# emoji fonts
sudo apt-get install -y ttf-ancient-fonts ttf-bitstream-vera


## 1. Download the latest version
# wget https://github.com/eosrei/emojione-color-font/releases/download/v1.4/EmojiOneColor-SVGinOT-Linux-1.4.tar.gz
## 2. Uncompress the file
#tar zxf EmojiOneColor-SVGinOT-Linux-1.4.tar.gz
## 3. Run the installer
#cd EmojiOneColor-SVGinOT-Linux-1.4
#./install.sh
#rm install.sh


# for iphone connect on linux
# instruction here: https://gist.github.com/samrocketman/70dff6ebb18004fc37dc5e33c259a0fc

# Add password less sudo user
useradd $USER
usermod -aG sudo $USER
echo "$USER  ALL=(ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/$USER"

# Start wifi hotspot for network "test_bcd" with password ... on "wlo1" interface
# sudo nmcli dev wifi hotspot ifname wlo1 ssid test_bcd password 09869219

## Aliases
echo 'alias gss="git status -s"' >> ~/.bash_aliases

