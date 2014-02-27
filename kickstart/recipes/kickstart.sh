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
  `"$@" >/dev/null 2>&1`
  return $?
}

kickstart.command_exists() {
  which $1 >/dev/null 2>&1
}

kickstart.print_with_separator() {
  (
  IFS=$1
  shift
  echo -e "$*"
  )
}

for recipe in recipes/kickstart/*; do
  source $recipe
done
