kickstart.os() {
  ( uname -a | grep -q Ubuntu ) && echo "Ubuntu"
}

kickstart.codename() {
  lsb_release -sc
}

kickstart.info() {
  [ "$kickstart_context" ] && echo "$kickstart_context >> $@" >&2 || echo "$@" >&2
}

kickstart.context() {
  kickstart_context=""
  kickstart.info "Setting up $@"
  kickstart_context="$@"
}

kickstart.mute() {
  kickstart.info "Running \"$@\""
  `$@ >/dev/null 2>&1`
  return $?
}

kickstart.add_to_profile.d() {
  file=$1
  [ ! -f files/$file ] && kickstart.info "File files/$file not found" && exit 1

  cp files/$file /etc/profile.d/$file
  grep -q $file /etc/zshenv 2>/dev/null || ( echo "[[ -f /etc/profile.d/$file ]] && source /etc/profile.d/$file" >> /etc/zshenv )
}

for recipe in recipes/kickstart/*; do
  source $recipe
done
