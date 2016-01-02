export PS1="\[\e[35m\][\[\e[m\]\[\e[36m\]\d\[\e[m\] \[\e[36m\]\@\[\e[m\]\[\e[35m\]]\[\e[m\] \[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\\$  "

os=`uname`

if [ $os == "Darwin" ]; then
  for bin in `find ~/Applications -name bin`; do
    export PATH=$PATH:$bin
  done
fi

if [ -e ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
