kickstart.group.create() {
  kickstart.info "Creating group $1"
  grep -q $1 /etc/group || groupadd $1
}
