name=$1 # site.domain
fastcgi_pass=${2:-'unix:/run/php/php7.3-fpm.sock'}
cat >> /etc/nginx/sites-available/$name.conf << EOF

# Force HTTPS
server {
  listen 80;
  listen [::]:80;
  server_name $name www.$name;
  return 301 https://$name$request_uri;
}

# Force www less version'
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name www.$name;
    ssl_certificate /etc/letsencrypt/live/$name/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$name/privkey.pem;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
    return 301 https://$name$request_uri;
}


server {
    server_name $name;

    # SSL config
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_tokens off;
    ssl_buffer_size 8k;
    ssl_protocols TLSv1.3 TLSv1.2 TLSv1.1 TLSv1;
    ssl_prefer_server_ciphers on;
    ssl_ciphers ECDH+AESGCM:ECDH+AES256:ECDH+AES128:DH+3DES:!ADH:!AECDH:!MD5;
    ssl_ecdh_curve secp384r1;
    ssl_session_tickets off;

    # OCSP stapling
    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4;

    ssl_certificate /etc/letsencrypt/live/$name/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$name/privkey.pem;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
    # End of SSL config

    index index.php index.html;
    error_log /var/www/html/$name/storage/logs/error.log;
    access_log /var/www/html/$name/storage/logs/access.log;
    root /var/www/html/$name/public;
    error_page 404 /index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
        gzip_static on;

        proxy_set_header        Host $server_name;
        proxy_set_header        X-Real-IP $remote_addr;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header        X-Forwarded-Proto $scheme;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass $fastcgi_pass;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;

        fastcgi_buffers 8 64k;
        fastcgi_buffer_size 128k;
        fastcgi_connect_timeout 3000;
        fastcgi_send_timeout 3000;
        fastcgi_read_timeout 3000;
    }

    location ~ /\.ht {
        deny all;
    }

    location ~ /.well-known {
        allow all;
    }
}
EOF
