kickstart.service.enable() {
  [ `which enable` ] && enable $1
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}
kickstart.service.disable() {
  [ `which disable` ] && disable $1
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}

kickstart.service.start() {
  [ `which start` ] && start $1
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}

kickstart.service.stop() {
  [ `which stop` ] && stop $1
  kickstart.os.is "Mac" && kickstart.info "Mac services not supported yet"
}

kickstart.service.restart() {
  kickstart.service.stop $1
  kickstart.service.start $1
}

