#!/bin/bash

BASHWF="${HOME}/bashwf"
source utils.sh
source setup.sh

cd src/

echo_info "$name"

if check_requirements; then
  setup;
else
  echo_warn "Error installing $name: Requirements not met"
fi

echo ""

echo_pass "Setup Complete"
echo "
You can use this function to quickly load bash workflow.
Just insert it into whatever .profile/.bashrc/etc bash init file you use.

function wf()
{
  source \${HOME}/bashwf/bashwf
}
"