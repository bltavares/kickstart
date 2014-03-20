kickstart.package.installed() {
  kickstart.package.installed.`kickstart.package.manager` "$@"
}

kickstart.package.installed.apt-get() {
  kickstart.mute dpkg -s "$@"
}

kickstart.package.installed.brew() {
  ! $(brew info "$@" | kickstart.stream.contains "Not installed")
}

kickstart.package.installed.pacman() {
  kickstart.mute pacman -Q "$@"
}

kickstart.package.installed.yum() {
  local yum_packages="`yum list installed`"
  for package in "$@"; do
    kickstart.stream.contains $package <<<$yum_packages || return 1
  done
  return 0
}
