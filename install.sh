#!/bin/bash

#Install the dotfiles to their rightful place
for file in proteus.yaml gitconfig slate tmux.conf vimrc zshrc; do
  ln -f -s $PWD/$file ~/.$file
done

ln -f -s $PWD/oh-my-zsh/themes/jeff.zsh-theme ~/.oh-my-zsh/themes/jeff.zsh-theme
