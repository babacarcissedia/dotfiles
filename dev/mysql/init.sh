name=$1
username=${2:-'root'}
password=${3:-'root'}
echo '' > tmp.sql
echo "CREATE USER $name@localhost identified with mysql_native_password by \"$name\";" >> tmp.sql
echo "CREATE DATABASE $name charset utf8 collate utf8_general_ci;" >> tmp.sql
echo "GRANT ALL PRIVILEGES ON $name.* to $name@localhost;" >> tmp.sql
mysql -u$username -p$password -e "source tmp.sql"


mysql -uroot -proot -e "CREATE DATABASE $name charset utf8 collate utf8_general_ci;"
