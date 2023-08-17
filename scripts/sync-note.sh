
timestamp() {
  date +"at %H:%M:%S on %d/%m/%Y"
}

# sync note
sync_git_repo() {
  local target_dir=$1
  
  cd $target_dir; pwd
  git pull
  git add --all
  git commit -am "auto-commit $(timestamp)"
  git push origin master
}


input_file=$1
cat $input_file | while read line; do
  sync_git_repo ${line}
  echo "------------------------------------------"
done

