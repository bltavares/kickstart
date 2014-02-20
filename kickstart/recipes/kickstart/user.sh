kickstart.user.add_group() {
  grep -q $2 <(groups $1) || usermod -a -G $2 $1
}
