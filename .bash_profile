export PS1="\e[0;35m[\e[0;36m\D{%F} \@\e[0;35m] \e[0;32m\u@\h \e[1;34m\W\e[0;37m\$ "

os=`uname`

if [ $os == "Darwin" ]; then
  for bin in `find ~/Applications -name bin`; do
    export PATH=$PATH:$bin
  done
fi

if [ -e ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
