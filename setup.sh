#!/bin/bash -e

dotfiles=(.vim .vimrc)

for dotfile in ${dotfiles[*]}; do
  src=`pwd`/$dotfile
  if [ -e $src ]; then
    target=~/$dotfile
    if [ -L $target ]; then
      rm $target
    else
      if [ -d $target ]; then
        rm -rf $target
      else
        rm $target
      fi
   fi
   ln -s $src $target
    echo "INFO : linked $src to $target"
  else
    echo "ERROR: source $src not found!"
  fi
done
