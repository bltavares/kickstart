kickstart.os() {
  [ -f /etc/lsb-release ] && echo "Ubuntu"
  [ -f /etc/redhat-release ] && echo "RHEL"
  uname -a | kickstart.stream.contains Darwin && echo "Mac"
}

kickstart.os.is() {
  [[ `kickstart.os` == "$1" ]]
}

kickstart.os.codename() {
  lsb_release -sc
}

