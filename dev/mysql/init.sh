name=$1
username=${2:-$name}
password=${3:-$name}
root_username=${4:-'root'}
root_password=${5:-''}
echo '' > tmp.sql
echo "CREATE USER $name@localhost identified with mysql_native_password by \"$password\";" >> tmp.sql
echo "CREATE DATABASE $name charset utf8 collate utf8_general_ci;" >> tmp.sql
echo "GRANT ALL PRIVILEGES ON $name.* to $name@localhost;" >> tmp.sql
mysql -u$root_username -p$root_password -e "source tmp.sql"


mysql -u$root_username -p$root_password -e "CREATE DATABASE $name charset utf8 collate utf8_general_ci;"
