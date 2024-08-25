$APP_USER=$2
APP_ROOT="/var/www/vhosts/$DOMAIN"
touch /etc/nginx/sites-available/$DOMAIN.conf
ln -s /etc/nginx/sites-available/$DOMAIN.conf /etc/nginx/sites-enabled/$DOMAIN.conf

mkdir -p /var/www/vhosts/$DOMAIN/storage/logs
touch /var/www/vhosts/$DOMAIN/storage/logs/error.log
touch /var/www/vhosts/$DOMAIN/storage/logs/access.log

cat >> /etc/nginx/sites-available/$DOMAIN.conf << EOF

# Force HTTPS
server {
listen 80;
listen [::]:80;
server_name $DOMAIN www.$DOMAIN;
return 301 https://$DOMAIN\$request_uri;
}

# Force www less version'
server {
listen 443 ssl http2;
listen [::]:443 ssl http2;
server_name www.$DOMAIN;
ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;
ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
return 301 https://$DOMAIN\$request_uri;
}


server {
    server_name $DOMAIN;

    # SSL config
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_tokens off;
    ssl_buffer_size 8k;
    ssl_protocols TLSv1.3 TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_ciphers ECDH+AESGCM:ECDH+AES256:ECDH+AES128:DH+3DES:!ADH:!AECDH:!MD5;
    ssl_ecdh_curve secp384r1;
    ssl_session_tickets off;

    # OCSP stapling
    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4;

    ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
    # End of SSL config


    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
    add_header X-XSS-Protection "1; mode=block";
    add_header 'Content-Security-Policy' 'upgrade-insecure-requests';


    # GZIP
    gzip on;
    gzip_min_length 100; # min size 100kb
    gzip_comp_level 7; # 1-9
    gzip_types text/plain text/css application/javascript image/*;
    
    # Media: images, icons, video, audio, HTC
    location ~* \.(?:jpg|jpeg|gif|png|ico|cur|gz|svg|svgz|mp4|mp3|ogg|ogv|webm|htc|woff2|woff)$ {
        expires 1M;
        access_log off;
        # max-age must be in seconds
        add_header Cache-Control "max-age=2629746, public";
    }

    # CSS and Javascript
    location ~* \.(?:css|js)$ {
        expires 1y;
        access_log off;
        # max-age must be in seconds
        add_header Cache-Control "max-age=31556952, public";
    }

    charset utf-8;

    index index.php index.html;
    error_log $APP_ROOT/storage/logs/error.log;
    access_log $APP_ROOT/storage/logs/access.log;
    root $WEBROOT;
    error_page 404 /index.php;


    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
        gzip_static on;

        proxy_set_header        Host \$server_name;
        proxy_set_header        X-Real-IP \$remote_addr;
        proxy_set_header        X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header        X-Forwarded-Proto \$scheme;
    }

    location ~ \.php$ {
        try_files \$uri /index.php =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php$PHP_VERSION-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param PATH_INFO \$fastcgi_path_info;

        fastcgi_buffers 8 64k;
        fastcgi_buffer_size 128k;
        fastcgi_connect_timeout 3000;
        fastcgi_send_timeout 3000;
        fastcgi_read_timeout 3000;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }

    client_max_body_size 128m;
    # For unlimited
    # client_max_body_size 0;
}
EOF

# permissions
sudo find storage -type f -exec chmod 664 {} \;
sudo find storage -type d -exec chmod 775 {} \;
sudo chmod -R ug+rwx storage bootstrap/cache
sudo chgrp -R www-data storage bootstrap/cache
sudo usermod -aG $APP_USER www-data
sudo chown $APP_USER:www-data -R storage bootstrap/cache

# Check file exists
# /etc/ssl/dhparams.pem
# Generate if not
# openssl dhparam -out /etc/ssl/dhparams.pem 4096


cat >> /etc/php/$PHP_VERSION/cli/php.ini << EOF
post_max_size=128M
upload_max_filesize=128M
max_upload_file=50
EOF
