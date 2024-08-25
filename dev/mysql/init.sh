# TODO: check variable exist
echo '' > tmp.sql
echo "CREATE USER $DB_USERNAME@$DB_HOST identified with mysql_native_password by \"$DB_PASSWORD\";" >> tmp.sql
echo "CREATE DATABASE $DB_DATABASE charset utf8 collate utf8_general_ci;" >> tmp.sql
echo "GRANT ALL PRIVILEGES ON $DB_DATABASE.* to $DB_USERNAME@$DB_HOST;" >> tmp.sql
mysql -uroot -p -e "source tmp.sql"


mysql -u$root_username -p$root_password -e "CREATE DATABASE $name charset utf8 collate utf8_general_ci;"
