#!/bin/bash

BASHWF="${HOME}/bashwf"
source utils.sh

setup_list="bash c"
echo_info "Bash Workflow Setup"

src_dir="$PWD/src"
tests_dir="$PWD/tests"

cd src/

for setup_file in $setup_list; do
  unset name
  unset dependencies
  unset check_requirements

  source setup_$setup_file.sh

  echo_info "Begin $name"

  if check_requirements; then
    setup_func="setup_$setup_file"
    cd $setup_file/
    eval "$setup_func"
    cd ../
  else
    echo_warn "Error installing $name: Requirements not met"
  fi

  echo_info "End $name"
  echo ""
done

echo_pass "Setup Complete"
echo "
You can use this function to quickly load bash workflow.
Just insert it into whatever .profile/.bashrc/etc bash init file you use.

function wf()
{
  source \${HOME}/bashwf/bashwf
}
"