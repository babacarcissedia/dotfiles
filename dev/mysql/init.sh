name=$1
root_password=${2:-'root'}
echo '' > tmp.sql
echo "CREATE USER $name@localhost identified with mysql_native_password by \"$name\";" >> tmp.sql
echo "CREATE DATABASE $name charset utf8 collate utf8_general_ci;" >> tmp.sql
echo "GRANT ALL PRIVILEGES ON $name.* to $name@localhost;" >> tmp.sql
mysql -uroot -p$root_password -e "source tmp.sql"


mysql -uroot -proot -e "CREATE DATABASE mmtrransport charset utf8 collate utf8_general_ci;"
