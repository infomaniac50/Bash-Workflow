#!/bin/bash

BASHWF="${HOME}/bashwf"
source utils.sh

setup_list="bash c"
echo_info "Bash Workflow Setup"

src_dir="$PWD/src"
tests_dir="$PWD/tests"

cd src/

for setup_file in $setup_list; do
  echo_info "Begin $setup_file"
  source setup_$setup_file.sh
  setup_func="setup_$setup_file"
  cd $setup_file/
  eval "$setup_func"
  cd ../
  echo_info "End $setup_file"
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