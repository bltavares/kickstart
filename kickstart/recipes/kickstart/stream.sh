kickstart.stream.contains() {
  grep -q "$1" 2>/dev/null
}

kickstart.stream.template() {
  eval "echo -e \"`cat`\""
}
