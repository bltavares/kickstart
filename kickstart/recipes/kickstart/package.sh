kickstart.package.manager() {
  kickstart.command_exists apt-get && echo "apt-get" && return 0
  kickstart.command_exists brew && echo "brew" && return 0
  kickstart.command_exists yum && echo "yum" && return 0
  kickstart.command_exists pacman && echo "pacman" && return 0
  kickstart.info "kickstart supports apt-get, yum, pacman or brew" && exit 1
}

for recipe in recipes/kickstart/package/*.sh; do
  source $recipe
done
