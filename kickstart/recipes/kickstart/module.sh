kickstart.module.apply_role() {
  kickstart.module.apply_ "$1" "$2" roles
}

kickstart.module.apply_recipe() {
  kickstart.module.apply_ "$1" "$2" recipes
}

kickstart.module.apply_() {
  local cur_dir;
  cur_dir=$(pwd)
  cd modules/"$1"
  source "$3"/"$2".sh
  cd "$cur_dir"
}
