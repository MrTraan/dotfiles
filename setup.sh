#!/bin/bash

mkdir -p ~/.vim/colors ~/.vim/bundle
cp -R ./vim/colors/* ~/.vim/colors/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ -f "$HOME/.vimrc" ]; then
    printf ".vimrc file already exists, override ? [y/n] "
    read y
    if [ "$y" != "y" ]; then
        exit 0
    fi

    echo "creating backup at $HOME/vimrc_backup"
    mv ~/.vimrc ~/vimrc_backup
fi

ln -s `pwd`/vimrc ~/.vimrc
vim +PluginInstall
