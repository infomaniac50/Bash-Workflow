#!/bin/bash

# Text color variables
txtgrn='\e[0;32m'       # green
txtylw='\e[0;33m'       # yellow
txtblu='\e[0;34m'       # blue

txtrst='\e[0m'          # Text reset

# Feedback indicators
function echo_info() { echo -e "${txtblu}$*${txtrst}"; }
function echo_pass() { echo -e "${txtgrn}$*${txtrst}"; }
function echo_warn() { echo -e "${txtylw}$*${txtrst}"; }

function cp_rename()
{
    if [[ ! -f $2/$1 ]]; then
      echo_info "Copying $1 to $2/$1"
      cp $1 $2/$1
    else
      if [[ $(diff -q $1 $2/$1) ]]; then
        echo_warn "$1 exists copying as $1.new"
        cp $1 $2/$1.new
      else
        echo_info "Skipping file $1 with equal content."
      fi
    fi
}

function cp_folder()
{
  if [[ ! -d $BASHWF/$1 ]]; then
    mkdir $BASHWF/$1
  fi

  cp -R $1/* $BASHWF/$1/
}

function command_exists ()
{
    hash "$1" 2>/dev/null;
    return $?
}
