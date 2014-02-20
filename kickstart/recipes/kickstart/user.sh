kickstart.user.add_group() {
  kickstart.info "Adding $2 group to $1"
  grep -q $2 <(groups $1) || usermod -a -G $2 $1
}
