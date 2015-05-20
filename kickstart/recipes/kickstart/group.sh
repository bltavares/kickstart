kickstart.group.create() {
  kickstart.info "Creating group $1"
  kickstart.file.contains /etc/group "$1" || groupadd "$1"
}
