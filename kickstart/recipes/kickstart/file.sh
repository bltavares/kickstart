kickstart.file.link() {
  rm -rf $2 2>/dev/null
  ln -s $1 $2
}

kickstart.file.contains() {
  grep -q $2 $1 2>/dev/null
}
