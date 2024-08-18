name=$1 # site.domain
webroot=${3:-"/var/www/vhosts/$name"}
touch "/etc/nginx/sites-available/$name.conf"
ln -s "/etc/nginx/sites-available/$name.conf" "/etc/nginx/sites-enabled/$name.conf"
cat >> "/etc/nginx/sites-available/$name.conf" << EOF

server {
    listen 80 default_server;
    root $webroot;
    server_name $name www.$name;
}
EOF
