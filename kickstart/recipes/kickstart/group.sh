kickstart.group.create() {
  grep -q $1 /etc/group || groupadd docker
}
