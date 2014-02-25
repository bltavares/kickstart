kickstart.apt.ppa() {
  kickstart.mute add-apt-repository -y $1
  kickstart.package.update
}

kickstart.apt.add_key_from_url() {
  kickstart.download.stream $1 | kickstart.mute apt-key add -
}

kickstart.apt.add_key_from_keychain() {
  kickstart.mute apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv $1
}
