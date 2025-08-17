version=${1:-'22'}
echo "Installing nvm + node $version"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install $version
nvm exec $version npm i yarn -g
