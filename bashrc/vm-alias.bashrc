if command_exists vagrant; then
  alias va='vagrant'
  alias vup='vagrant up'
  alias vstop='vagrant halt'
  alias vpause='vagrant suspend'
  alias vssh='vagrant ssh'

fi

if command_exists vboxmanage; then
  alias vm=vboxmanage
  alias vmstart='vboxmanage startvm'
fi
