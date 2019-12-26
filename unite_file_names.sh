directory=$1

# For directories
find $directory -name "*.*" | rename 's/ /_/g'

find $directory -name "*.*" | rename 's/-/_/g'

## rename uppercase to lowercase
find $directory -depth -exec rename -v 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;

