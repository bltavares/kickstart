kickstart.package.manager() {
  kickstart.command_exists apt-get && echo "apt-get" && return 0
  kickstart.command_exists brew && echo "brew" && return 0
  kickstart.info "kickstart supports apt-get or brew" && exit 1
}

kickstart.package.installed() {
  local pkg_manager=`kickstart.package.manager`
  [ $pkg_manager = 'apt-get' ] && dpkg -s $@ >/dev/null 2>&1 && return $?
  [ $pkg_manager = 'brew' ] && ! $(brew info $@ | grep -q "Not installed") && return $?
}

kickstart.package.install() {
  if kickstart.package.installed "$@"; then
    kickstart.info "$@ already installed"
  else
    kickstart.info "No packages found matching $@. Installing..."
    kickstart.mute "`kickstart.package.manager` install -y $@"
  fi
}

kickstart.package.update() {
  kickstart.mute "`kickstart.package.manager` update -y"
}

kickstart.package.upgrade() {
  kickstart.mute "`kickstart.package.manager` upgrade -y"
}
