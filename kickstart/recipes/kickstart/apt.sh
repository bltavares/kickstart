kickstart.apt.ppa() {
  if ! cat /etc/apt/sources.list.d/* | kickstart.stream.contains "${1#ppa:}"; then
    if ! kickstart.command_exists add-apt-repository; then
      kickstart.info "Required add-apt-repository command not found. Installing package."
      kickstart.package.install python-software-properties || kickstart.package.install software-properties-common
    fi

    kickstart.mute add-apt-repository -y "$1"
    kickstart.package.update
  fi
}

kickstart.apt.add_key_from_url() {
  kickstart.download.stream "$1" | kickstart.mute apt-key add -
}

kickstart.apt.add_key_from_keychain() {
  kickstart.mute apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv "$1"
}
