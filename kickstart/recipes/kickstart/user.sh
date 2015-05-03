kickstart.user.create() {
  kickstart.mute id $1 || ( useradd -m -s /bin/bash -U -p `openssl passwd -1 $2` $1 )
}

kickstart.user.is_on_group() {
  id -nG $1 | kickstart.stream.contains $2
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

kickstart.user.exec.command.module() {
  local cur_dir=`pwd`
  cat <<COMMAND
  cd modules/kickstart
  source install.sh
  cd $cur_dir
  $@
COMMAND
}

kickstart.user.exec.command.infect() {
  cat <<COMMAND
  eval "$(kickstart infect)"
  $@
COMMAND
}

kickstart.user.exec() {
  local user=$1
  shift

  local command=''
  kickstart.command_exists kickstart && \
    command=`kickstart.user.exec.command.infect "$@"` || \
    command=`kickstart.user.exec.command.module "$@"`

  kickstart.info Running \'"$@"\' as $user
  sudo -H -u $user bash -c "$command"
}

kickstart.user.root?() {
  [ `whoami` == root ]
}
