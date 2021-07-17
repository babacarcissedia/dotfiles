name=$1
root_password=${2:-'root'}
mysql -uroot -p$root_password -e \
  CREATE USER $name@localhost identified with mysql_native_password by "$name"; \
  CREATE DATABASE $name charset utf8 collate utf8_general_ci; \
  GRANT ALL PRIVILEGES ON $name.* to $name@localhost;

