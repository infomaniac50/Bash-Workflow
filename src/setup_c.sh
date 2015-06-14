#!/bin/bash
name="Bash Workflow - C Supplements"

dependencies="gcc"

function check_requirements() {
  for prog in $dependencies; do
    if ! command_exists $prog; then
      return 1;
    fi;
  done;

  return 0;
}

function setup_c()
{
  file_list="eat"
  echo "gcc --std=gnu99 --pedantic -Wall -Wfatal-errors -Werror=implicit-function-declaration -I. stringtype.c eat.c -o eat"
  if gcc --std=gnu99 --pedantic -Wall -Wfatal-errors -Werror=implicit-function-declaration -I. stringtype.c eat.c -o eat; then
    echo "mv eat ${BASHWF}/bin/eat"
    mv eat ${BASHWF}/bin/eat
  fi
}