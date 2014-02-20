kickstart.os() {
  ( uname -a | grep -q Ubuntu ) && echo "Ubuntu"
}

kickstart.codename() {
  lsb_release -sc
}

kickstart.info() {
  echo $@ >&2
}

kickstart.mute() {
  echo "Running \"$@\""
  `$@ >/dev/null 2>&1`
  return $?
}

kickstart.add_to_profile.d() {
  file=$1
  [ ! -f files/$file ] && echo "File files/$file not found" && exit 1

  cp files/$file /etc/profile.d/$file
  grep -q $file /etc/zshenv 2>&1 || ( echo "[[ -f /etc/profile.d/$file ]] && source /etc/profile.d/$file" >> /etc/zshenv )
}

for recipe in recipes/kickstart/*; do
  source $recipe
done
