kickstart.user.create() {
  kickstart.mute "id $1" || ( useradd -m -s /bin/bash -U -p `openssl passwd -1 $2` $1 )
}

kickstart.user.add_group() {
  kickstart.info "Adding $2 group to $1"
  grep -q $2 <(groups $1) || usermod -a -G $2 $1
}
