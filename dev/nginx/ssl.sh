domain=$1
email=${2:-"babacarcissedia@gmail.com"}
sudo apt-get install -y python3-certbot-nginx

certbot certonly -a manual --rsa-key-size 4096 --email $email -d $domain -d www.$domain

## Might be the renew
# sudo certbot --nginx -d $domain -d www.$domain
