mkdir -p storage/framework/{sessions,views,cache}
chmod -R 775 storage/framework
sudo find storage -type f -exec chmod 664 {} \;
sudo find storage -type d -exec chmod 775 {} \;
sudo chmod -R ug+rwx storage bootstrap/cache
sudo chgrp -R www-data storage bootstrap/cache
sudo usermod -aG $APP_USER www-data
sudo chown $APP_USER:www-data -R storage bootstrap/cache
