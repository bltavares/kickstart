kickstart.info() {
  [ "$kickstart_context" ] && echo "$kickstart_context >> $*" >&2 || echo "$*" >&2
}

kickstart.context() {
  kickstart_context=""
  kickstart.info "Setting up $*"
  kickstart_context="$*"
}

kickstart.debugging() {
  set -o | grep xtrace | kickstart.stream.contains on
}

kickstart.mute() {
  kickstart.info "Running \"$*\""
  if kickstart.debugging; then
    "$@"
  else
    "$@" >/dev/null 2>&1
  fi
  return $?
}

kickstart.suppress_error() {
  kickstart.info "Running \"$*\""
  if kickstart.debugging; then
    "$@"
  else
    "$@" 2>/dev/null
  fi
  return $?
}

kickstart.command_exists() {
  which "$1" > /dev/null
}

kickstart.print_with_separator() {
  (
  IFS=$1
  shift
  echo -e "$*"
  )
}

for recipe in recipes/kickstart/*.sh; do
  source "$recipe"
done
