
touch "/etc/nginx/sites-available/$DOMAIN.conf"
ln -s "/etc/nginx/sites-available/$DOMAIN.conf" "/etc/nginx/sites-enabled/$DOMAIN.conf"
cat >> "/etc/nginx/sites-available/$DOMAIN.conf" << EOF

server {
    listen 80 default_server;
    root $WEBROOT;
    server_name $DOMAIN www.$DOMAIN;
}
EOF
