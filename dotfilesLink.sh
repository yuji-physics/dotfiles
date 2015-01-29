#!/bin/bash
# decide OS
echo `uname`
if [ `uname` = 'Darwin' ]; then
  OS='Mac'
elif [ `uname` = 'Linux' ]; then
  OS='Mac'
else
  OS='Win'
fi
echo "make symbolic links for $OS OS. [y or n]"
read LINKORNOT
case $LINKORNOT in
  y)
    echo "making link"
    ;;
  *)
    echo "abort"
    exit 1
    ;;
esac
ln -sfn ~/dotfiles/.bash_profile ~/.bash_profile
ln -sfn ~/dotfiles/.bashrc ~/.bashrc
ln -sfn ~/dotfiles/.gvimrc ~/.gvimrc
ln -sfn ~/dotfiles/.vim ~/.vim
ln -sfn ~/dotfiles/.vimrc ~/.vimrc
ln -sfn ~/dotfiles/.zsh ~/.zsh
ln -sfn ~/dotfiles/.zshenv ~/.zshenv
ln -sfn ~/dotfiles/.tmux.conf ~/.tmux.conf
if [ $OS = "Win" ]; then
  ln -sfn ~/dotfiles/.minttyrc ~/.minttyrc
  echo "execute dotfilesLink.bat after this script to make links for FireFox vimperator plugin resource documents."
  # DOS symbolic links
  # cmd /C dotfilesLink.bat.lnk
else
  ln -sfn ~/dotfiles/.vimperator ~/.vimperator
  ln -sfn ~/dotfiles/.vimperatorrc ~/.vimperatorrc
fi
echo "complete."
