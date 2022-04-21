version=${1:-7.4}
sudo rm /etc/alternatives/php
sudo ln -s /usr/bin/php$version /etc/alternatives/php
