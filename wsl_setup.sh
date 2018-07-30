#!/bin/bash

cd ~

sudo sed -i 's/\/archive\.ubuntu/\/jp\.archive\.ubuntu/' /etc/apt/sources.list

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y language-pack-ja
sudo update-locale LANG=ja_JP.UTF-8

sudo apt install -y zsh
