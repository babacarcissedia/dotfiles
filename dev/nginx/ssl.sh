sudo apt-get install -y python3-certbot-nginx



## Might be the renew
# sudo certbot --nginx -d $domain -d www.$domain
chmod 0755 /etc/letsencrypt/{live,archive}

# manual
# certbot certonly -a manual --rsa-key-size 4096 --email $email -d $domain -d www.$domain

# auto
## With base nginx config
certbot certonly --nginx --rsa-key-size 4096 --email $WEBMASTER_EMAIL -d $DOMAIN -d www.$DOMAIN

## Renew command
# crontab -e
# 0 0 1 */3 * /usr/bin/certbot renew --quiet


