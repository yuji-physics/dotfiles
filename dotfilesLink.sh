#!/bin/bash
# decide OS
echo -n "System: "
echo `uname`
if [ `uname` = 'Darwin' ]; then
  OS='Mac'
elif [ `uname` = 'Linux' ]; then
  OS='Mac'
else
  OS='Win'
fi
echo "make symbolic links for $OS OS. [y or n (default)]"
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
if [ $OS = "Win" ]; then
  # Use conemu instead of mintty now.
  # ln -sfn ~/dotfiles/.minttyrc ~/.minttyrc
  ln -sfn ~/dotfiles/.bash_profile ~/.bash_profile
  ln -sfn ~/dotfiles/.bashrc ~/.bashrc
  ln -sfn ~/dotfiles/.inputrc ~/.inputrc
  echo 'Execute dotfilesLink.bat in "cmd prompt" to make links for DOS.'
  # DOS symbolic links
  # Do not work well now. Execute in cmd.
  # cmd /C dotfilesLink.bat.lnk
else
  ln -sfn ~/dotfiles/.bash_profile ~/.bash_profile
  ln -sfn ~/dotfiles/.bashrc ~/.bashrc
  ln -sfn ~/dotfiles/.inputrc ~/.inputrc
  ln -sfn ~/dotfiles/.gvimrc ~/.gvimrc
  ln -sfn ~/dotfiles/.vim ~/.vim
  ln -sfn ~/dotfiles/.vimrc ~/.vimrc
  ln -sfn ~/dotfiles/.zsh ~/.zsh
  ln -sfn ~/dotfiles/.zshenv ~/.zshenv
  ln -sfn ~/dotfiles/.tmux.conf ~/.tmux.conf
  ln -sfn ~/dotfiles/.vimperator ~/.vimperator
  ln -sfn ~/dotfiles/.vimperatorrc ~/.vimperatorrc
fi
echo "complete."
