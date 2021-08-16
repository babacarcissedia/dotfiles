domain=$1
sudo apt-get install python3-certbot-nginx
sudo certbot --nginx -d $domain -d www.$domain
