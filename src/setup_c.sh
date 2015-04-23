#!/bin/bash

function setup_c()
{
  file_list="eat"
  echo "gcc --std=gnu99 --pedantic -Wall -Wfatal-errors -Werror=implicit-function-declaration -I. stringtype.c eat.c -o eat"
  if gcc --std=gnu99 --pedantic -Wall -Wfatal-errors -Werror=implicit-function-declaration -I. stringtype.c eat.c -o eat; then
    echo "mv eat ${BASHWF}/bin/eat"
    mv eat ${BASHWF}/bin/eat
  fi
}