#!/bin/bash -e

dotfiles=(.bash_profile .vim .vimrc)

for dotfile in ${dotfiles[*]}; do
  src=`pwd`/$dotfile
  if [ -e $src ]; then
    target=~/$dotfile
    if [ -L $target ]; then
      rm $target
    else
      backup=backup
      mkdir -p $backup
      timestamp=`date +%s`
      to=`pwd`/$backup/$dotfile.$timestamp
      mv $target $to
      echo "INFO : backed up $target to $to" 
   fi
   ln -s $src $target
   echo "INFO : linked $src to $target"
    if [ $dotfile == ".bash_profile" ]; then
      echo "INFO : reloading .bash_profile"
      source ~/.bash_profile
    fi
  else
    echo "ERROR: source $src not found!"
  fi
done
