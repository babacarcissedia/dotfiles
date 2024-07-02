#! /bin/bash
user=${0:-$(USER)}
root_dir="/home/$user/www/"
processes=4
sudo apt get install -y supervisor
cat >> /etc/supervisor/conf.d/laravel-worker.conf << EOF
process_name=%(program_name)s_%(process_num)02d
command=php ${root_dir}/artisan queue:work --sleep=3 --tries=3 --max-time=3600
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=${user}
numprocs=${processes}
redirect_stderr=true
stdout_logfile=${root_dir}/storage/logs/worker.log
stopwaitsecs=3600
EOF

sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start all
