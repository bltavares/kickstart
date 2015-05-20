kickstart.package.install() {
  if kickstart.package.installed "$*"; then
    kickstart.info "$* already installed"
  else
    kickstart.info "No packages found matching $*. Installing..."
    kickstart.package.install."$(kickstart.package.manager)" "$*"
  fi
}

kickstart.package.install.apt-get() {
  kickstart.mute apt-get install -y "$*"
}

kickstart.package.install.brew() {
  kickstart.mute brew install -y "$*"
}

kickstart.package.install.yum() {
  kickstart.mute yum install -y "$*"
}

kickstart.package.install.pacman() {
  kickstart.mute pacman -S --noconfirm "$*"
}
