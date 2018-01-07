#!/bin/bash

cd ~

sudo sed -i 's/\/archive\.ubuntu/\/jp\.archive\.ubuntu/' /etc/apt/sources.list

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y language-pack-ja

sudo update-locale LANG=ja_JP.UTF-8

mkdir -p ~/.cache/dein && cd $_

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ~/.cache/dein
rm ./dein_installer.sh

cd ~

git clone https://github.com/sumtrue/dotfiles.git
ln -sf ~/dotfiles/.vimrc ~/.vimrc
