kickstart.os() {
  uname -a | kickstart.stream.contains Ubuntu && echo "Ubuntu"
  uname -a | kickstart.stream.contains Darwin && echo "Mac"
}

kickstart.os.is() {
  [[ `kickstart.os` == "$1" ]]
}

kickstart.os.codename() {
  lsb_release -sc
}

