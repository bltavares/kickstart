kickstart.service.enable() {
  kickstart.command_exists enable && enable "$1"
  kickstart.command_exists systemctl && systemctl enable "$1"
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}
kickstart.service.disable() {
  kickstart.command_exists disable && disable "$1"
  kickstart.command_exists systemctl && systemctl disable "$1"
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}

kickstart.service.start() {
  kickstart.command_exists start && start "$1"
  kickstart.command_exists systemctl && systemctl start "$1"
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}

kickstart.service.stop() {
  kickstart.command_exists stop && stop "$1"
  kickstart.command_exists systemctl && systemctl stop "$1"
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}

kickstart.service.restart() {
  kickstart.service.stop "$1"
  kickstart.service.start "$1"
}
