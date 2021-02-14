#! /bin/sh
remote=${remote:-"origin"}
branch=${branch:-"master"}

echo git add .
echo git commit -am "$commit" -S
echo git push -u "$remote" "$branch"
