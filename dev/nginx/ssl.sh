domain=$1
email=${2:-"babacarcissedia@gmail.com"}
sudo apt-get install -y python3-certbot-nginx

certbot certonly -a manual --rsa-key-size 4096 --email $email -d $domain -d www.$domain


## Might be the renew
# sudo certbot --nginx -d $domain -d www.$domain
chmod 0755 /etc/letsencrypt/{live,archive}

## iRedAdmin
mv /etc/ssl/certs/iRedMail.crt{,.bak}
mv /etc/ssl/private/iRedMail.key{,.bak}
ln -s "/etc/letsencrypt/live/$domain/privkey.pem" /etc/ssl/private/iRedMail.key
ln -s "/etc/letsencrypt/live/$domain/fullchain.pem" /etc/ssl/certs/iRedMail.crt

## With base nginx config
# sudo certbot --nginx --email $email -d $domain -d www.$domain

## Renew command
# sudo certbot certonly --nginx -d $domain -d www.$domain

