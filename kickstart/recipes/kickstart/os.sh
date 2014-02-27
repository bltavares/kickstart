kickstart.os() {
  ( uname -a | grep -q Ubuntu ) && echo "Ubuntu"
  ( uname -a | grep -q Darwin ) && echo "Mac"
}

kickstart.os.is() {
  [[ `kickstart.os` == "$1" ]]
}

