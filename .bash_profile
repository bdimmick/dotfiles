export PS1="\[\e[35m\][\[\e[m\]\[\e[36m\]\d\[\e[m\] \[\e[36m\]\@\[\e[m\]\[\e[35m\]]\[\e[m\] \[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\\$  "
export LSCOLORS=EagagehecaFadahBgBEBEB

alias ls="ls -pG"

os=`uname`

if [ $os == "Darwin" ]; then
  for bin in `find ~/Applications -name bin`; do
    export PATH=$PATH:$bin
  done

  # Find the latest Java version and set JAVA_HOME
  JAVA_VERSION=`ls /Library/Java/JavaVirtualMachines | sort | tail -1`
  if [ ! -z "${JAVA_VERSION}" ]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/${JAVA_VERSION}Contents/Home"
  fi

fi

function self-signed() {
  CN=$1
  if [ -z "$CN" ]; then
    CN=$HOSTNAME
  fi
  echo "Making self-signed x.509 certificate for '$CN'"
   
  openssl req -x509 -newkey rsa:2048 -keyout $CN.key -out $CN.cert -days 30 -nodes \
    -sha256 -subj "/C=US/ST=Washington/L=Seattle/O=hexagrammatic.com/OU=internal/CN=$CN"
}

function update-dotfiles() {
  PROFILE=`readlink ~/.bash_profile`
  pushd `dirname $PROFILE`
  git pull
  ./setup.sh
  popd
}

function push-dotfiles() {
  PROFILE=`readlink ~/.bash_profile`
  WHEN=`date`
  WHERE=`hostname`
  pushd `dirname $PROFILE`
  git commit -a -m "push-dotfiles from $WHERE on $WHEN"
  git push origin master
  popd
}

function public-ip {
  curl "http://ipinfo.io/ip"
}

if [ -e ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
