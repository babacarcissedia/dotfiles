program=$1
if [ -z $program ]
then
    echo "usage: $0 <program>"
    exit -1
fi
id=$(ps -e | grep $program | cut -d " " -f1)
kill -9 $id
echo "Killed program with $id"

