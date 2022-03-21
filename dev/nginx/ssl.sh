domain=$1
email=${2:-"babacarcissedia@gmail.com"}
sudo apt-get install -y python3-certbot-nginx

certbot certonly -a manual --rsa-key-size 4096 --email $email -d $domain -d www.$domain


## With base nginx config
# sudo certbot --nginx --email $email -d $domain -d www.$domain

## Renew command
# sudo certbot certonly --nginx -d $domain -d www.$domain
