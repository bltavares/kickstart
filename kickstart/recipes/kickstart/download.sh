kickstart.download.file() {
  kickstart.download.stream $1 > $2
}

kickstart.download.stream() {
  kickstart.info "Downloading $1"
  if [ `which curl` ]; then
    curl -Ls $1
  elif [ `which wget` ]; then
    wget -qO - $1
  else
    kickstart.info "No download application found, consider installing curl or wget"
    exit 1
  fi
}
