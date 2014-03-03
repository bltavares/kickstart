kickstart.package.manager() {
  kickstart.command_exists apt-get && echo "apt-get" && return 0
  kickstart.command_exists brew && echo "brew" && return 0
  kickstart.command_exists yum && echo "yum" && return 0
  kickstart.info "kickstart supports apt-get, yum or brew" && exit 1
}

kickstart.package.installed() {
  local pkg_manager=`kickstart.package.manager`

  if [ $pkg_manager = 'apt-get' ]; then
    dpkg -s "$@" >/dev/null 2>&1
    return $?
  fi

  if [ $pkg_manager = 'brew' ]; then
    ! $(brew info "$@" | kickstart.stream.contains "Not installed")
    return $?
  fi

  if [ $pkg_manager = 'yum' ]; then
    local yum_packages="`yum list installed`"
    for package in "$@"; do
      kickstart.stream.contains $package <<<$yum_packages || return 1
    done
    return 0
  fi
}

kickstart.package.install() {
  if kickstart.package.installed "$@"; then
    kickstart.info "$@ already installed"
  else
    kickstart.info "No packages found matching $@. Installing..."
    kickstart.mute `kickstart.package.manager` install -y "$@"
  fi
}

kickstart.package.update() {
  kickstart.mute `kickstart.package.manager` update -y
}

kickstart.package.upgrade() {
  kickstart.mute `kickstart.package.manager` upgrade -y
}
