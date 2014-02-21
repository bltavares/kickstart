kickstart.profile.add_to_profile() {
  local file=$1
  [ ! -f files/$file ] && kickstart.info "File files/$file not found" && exit 1

  local profile_d=`kickstart.profile.profile.d.location`
  mkdir -p $profile_d

  cp files/$file $profile_d/$file

  kickstart.profile.source_on_configuration_file $file $profile_d `kickstart.profile.location.zsh`
  kickstart.os.is Mac && kickstart.profile.source_on_configuration_file $file $profile_d `kickstart.profile.location.bash`
}

kickstart.profile.profile.d.location() {
  kickstart.os.is Ubuntu && echo /etc/profile.d
  kickstart.os.is Mac && echo ~/.profile.d
}

kickstart.profile.source_on_configuration_file() {
  local file=$1
  local profile_d=$2
  local configuration=$3
  grep -q $file $configuration 2>/dev/null || ( echo "[[ -f $profile_d/$file ]] && source $profile_d/$file" >> $configuration )
}

kickstart.profile.location.zsh() {
  [ `whoami` = root ] && echo /etc/zshenv || echo ~/.zshenv
}

kickstart.profile.location.bash() {
  [ `whoami` = root ] && echo /etc/profile || echo ~/.bashrc
}
