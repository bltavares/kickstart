kickstart.package.update() {
  kickstart.package.update."$(kickstart.package.manager)"
}

kickstart.package.update.apt-get() {
  kickstart.mute apt-get update -y
}

kickstart.package.update.brew() {
  kickstart.mute brew update -y
}

kickstart.package.update.yum() {
  kickstart.mute yum update -y
}

kickstart.package.update.pacman() {
  kickstart.mute pacman -Sy --noconfirm
}

kickstart.package.update.zypper() {
  kickstart.mute zypper refresh
}