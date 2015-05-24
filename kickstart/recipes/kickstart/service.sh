kickstart.service.enable() {
  exit_status=0
  kickstart.command_exists enable && enable "$1" && exit_status=$?
  kickstart.command_exists systemctl && systemctl enable "$1" && exit_status=$?
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet" && exit_status=1
  return $exit_status
}

kickstart.service.disable() {
  exit_status=0
  kickstart.command_exists disable && disable "$1" && exit_status=$?
  kickstart.command_exists systemctl && systemctl disable "$1" && exit_status=$?
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
  return $exit_status
}

kickstart.service.start() {
  exit_status=0
  kickstart.command_exists start && start "$1" && exit_status=$?
  kickstart.command_exists systemctl && systemctl start "$1" && exit_status=$?
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet" && exit_status=1
  return $exit_status
}

kickstart.service.stop() {
  exit_status=0
  kickstart.command_exists stop && stop "$1" && exit_status=$?
  kickstart.command_exists systemctl && systemctl stop "$1" && exit_status=$?
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet" && exit_status=1
  return $exit_status
}

kickstart.service.restart() {
  kickstart.service.stop "$1"
  kickstart.service.start "$1"
}
