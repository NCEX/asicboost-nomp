#!/bin/sh

# This is the Asicboost NOMP install script.
echo "Asicboost NOMP install script."
echo "Please do NOT run as root, run as the pool user!"

echo "Installing... Please wait!"

sleep 3

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y software-properties-common build-essential make gcc g++ screen nano wget curl ntp fail2ban git npm
sudo apt-get install -y libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libminiupnpc-dev
sudo apt-get install -y nodejs nodejs-legacy 

sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev -y

sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install -y redis-server

sudo systemctl enable fail2ban
sudo systemctl start fail2ban

sudo systemctl enable redis-server
sudo systemctl start redis-server

sudo systemctl enable ntp
sudo systemctl start ntp

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc

nvm install v8.1.4
nvm use v8.1.4
npm update -g

npm install -g pm2@latest
npm install -g npm@latest

npm install
npm update
npm audit fix

echo "Installation completed!"


exit 0
