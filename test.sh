#!/bin/bash

BASHWF="${HOME}/bashwf"
file_list="colors nocolors config utils.func init.sh init_unicode.sh init_colors.sh bashwf"
folder_list="bashrc functions bin"

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

function setup()
{
  # Create the bashwf directory if it doesn't exist.
  if [[ ! -d $BASHWF ]]; then
    echo_info "Creating directory $BASHWF"
    mkdir $BASHWF
  fi

  echo ""
  for folder in $folder_list; do
    echo_info "Recursively copying directory $folder"
    cp_folder $folder
  done

  echo ""
  # Don't overwrite the path folder if it already exists.
  if [[ ! -d $BASHWF/paths/ ]]; then
    echo_info "Copying paths directory."
    cp -R paths/ $BASHWF/
  else
    echo_warn "Skipping paths directory because it already exists."
  fi

  echo ""
  if [[ $OSTYPE == "msys" ]]; then
      echo_warn 'Win32 Detected. Cant chmod here.'
  else
    for file in $(find ${BASHWF}/bin/ -type f)
    do
      echo_info "Setting executable bit on $file"
      chmod u+x "$file"
    done
  fi

  echo ""
  for file in $file_list; do
    cp_rename $file $BASHWF
  done
}

echo_info "Bash Workflow Setup"

setup
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