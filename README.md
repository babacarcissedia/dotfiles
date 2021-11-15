# bcdbuddy dotfiles

## Installation
```bash
git clone git@github.com:bcdbuddy/dotfiles.git ~/dotfiles
ln -S ~/dotfiles ~/
```

## Dev
### Provision dev server
```bash
./dev/mysql/install.sh
./dev/composer/install.sh
./dev/php/install.sh
./dev/nginx/install.sh
./dev/nginx/laravel.sh $domain
./dev/nginx/ssl.sh $domain

```
