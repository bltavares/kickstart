kickstart.user.create() {
  kickstart.mute id $1 || ( useradd -m -s /bin/bash -U -p `openssl passwd -1 $2` $1 )
}

kickstart.user.is_on_group() {
  grep -q $2 <(id -nG $1)
}

kickstart.user.add_group() {
  kickstart.info "Adding $2 group to $1"
  kickstart.user.is_on_group $1 $2 || usermod -a -G $2 $1
}

kickstart.user.remove_group() {
  kickstart.info "Remove $1 from group $2"
  kickstart.user.is_on_group $1 $2 && \
    IFS=" " read -a groups < <(id -nG $1 | sed "s/$2//") && \
    usermod -G `kickstart.print_with_separator , ${groups[*]}` $1
}
