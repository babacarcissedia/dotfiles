name=$1 # site.domain
user=$(USER)
php_version=${2:-'8.2'}
webroot=${3:-'/var/www/html'}
touch /etc/nginx/sites-available/$name.conf
ln -s /etc/nginx/sites-available/$name.conf /etc/nginx/sites-enabled/$name.conf
cat >> /etc/nginx/sites-available/$name.conf << EOF

server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    server_name $name www.$name;
}
EOF
