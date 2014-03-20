kickstart.package.upgrade() {
  kickstart.package.upgrade.`kickstart.package.manager`
}

kickstart.package.upgrade.apt-get() {
  kickstart.mute apt-get upgrade -y
}

kickstart.package.upgrade.brew() {
  kickstart.mute brew upgrade -y
}

kickstart.package.upgrade.yum() {
  kickstart.mute yum upgrade -y
}

kickstart.package.upgrade.pacman() {
  kickstart.mute pacman -Suy --noconfirm
}
