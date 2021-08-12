#!/bin/bash

# Primero ejecutar el script en modo root y despues volver a ejectar el script usando el ZSH

if [[ $EUID -eq 0 ]]; then
    apt install gcc g++ emacs curl wget man python3 vim fonts-powerline -y
else
    git config --global user.email "xavi.mazon.bcn@gmail.com"
    git config --global user.name "Xavier Mazon"
    git config --global init.defaultBranch main
    git clone https://github.com/xaviermazon/MyConfigEmacs
    mv MyConfigEmacs ~/.emacs.d
    echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile
    source ~/.bash_profile
fi

