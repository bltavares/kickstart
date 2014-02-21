kickstart.download.file() {
  kickstart.download.stream $1 > $2
}

kickstart.download.stream() {
  kickstart.info "Downloading $1"
  if [ `which curl` ]; then
    curl -s $1
  elif [ `which wget` ]; then
    wget -qO - $1
  else
    kickstart.info "No download application found"
    exit 1
  fi
}
