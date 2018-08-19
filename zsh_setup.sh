#!/bin/zsh

# vim
mkdir -p ~/.cache/dein && cd $_

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ~/.cache/dein
rm ./dein_installer.sh

cd ~

# dotfiles
git clone https://github.com/sumtrue/dotfiles.git
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# tig
sudo apt install -y tig

# tmux
sudo apt install -y tmux

# docker
curl -O https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_17.09.0~ce-0~debian_amd64.deb
sudo dpkg -i docker-ce_17.09.0\~ce-0\~debian_amd64.deb
rm -f docker-ce_17.09.0\~ce-0\~debian_amd64.deb

sudo cgroupfs-mount
sudo usermod -aG docker $USER

# nodebrew
curl -L git.io/nodebrew | perl - setup

echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> .zshrc

nodebrew install-binary v10.7.0
nodebrew use v10.7.0
