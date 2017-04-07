#!/bin/bash

mkdir -p ~/.vim/colors
cp -R ./vim/colors/* ~/.vim/colors/

if [ -f "$HOME/.vimrc" ]; then
    printf ".vimrc file already exists, override ? [y/n] "
    read y
    if [ "$y" != "y" ]; then
        exit 0
    fi

    echo "creating backup at $HOME/vimrc_backup"
    mv ~/.vimrc ~/vimrc_backup
fi

cp ./vimrc ~/.vimrc
echo "Now run ':PluginInstall' from vim"
