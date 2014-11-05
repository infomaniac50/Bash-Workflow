
git_config_alias()
{
  local ALIAS=`git config --global alias.$1`;
  if [[ -z $ALIAS ]]; then
    git config --global alias.$1 $2
  fi
}

git_config_alias br branch
git_config_alias co checkout
git_config_alias com commit
git_config_alias sh stash
git_config_alias dif diff
git_config_alias di diff
git_config_alias st status
git_config_alias fe fetch
