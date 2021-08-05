#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    apt install gcc g++ emacs curl wget man python3 zsh vim fonts-powerline
    chsh -s /usr/bin/zsh daath
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
else
    git config --global user.email "xavi.mazon.bcn@gmail.com"
    git config --global user.name "Xavier Mazon"
    git config --global init.defaultBranch main
    git clone https://github.com/xaviermazon/MyConfigEmacs
    mv MyConfigEmacs .emacs.d
fi

