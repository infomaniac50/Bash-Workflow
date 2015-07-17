#!/bin/bash
name="Bash Workflow"

function check_requirements()
{
  # fake it
  return 0;
}

function setup()
{
  file_list="bashwf system/colors.sh system/config.sh system/init.sh system/init_colors.sh system/init_unicode.sh system/nocolors.sh system/utils.sh"
  folder_list="system/bashrc system/bin system/functions"

  # Create the bashwf directory if it doesn't exist.
  if [[ ! -d $BASHWF ]]; then
    echo_info "Creating directory $BASHWF"
    mkdir $BASHWF
  fi

  if [[ ! -d $BASHWF_SYS ]]; then
    echo_info "Creating directory $BASHWF_SYS"
    mkdir $BASHWF_SYS
  else
    echo_info "Recreating system directory $BASHWF_SYS"
    rm -rf $BASHWF_SYS
    mkdir $BASHWF_SYS
  fi

  if [[ ! -d $BASHWF_USER ]]; then
    echo_info "Creating user directory $BASHWF_USER"
    mkdir $BASHWF_USER
  fi

  echo ""
  for folder in $folder_list; do
    echo_info "Recursively copying system directory $folder"
    cp -ar $folder $BASHWF_SYS/
  done

  echo ""
  # Don't overwrite the path folder if it already exists.
  if [[ ! -d $BASHWF/paths/ ]]; then
    echo_info "Copying paths directory."
    cp_folder paths
  else
    echo_warn "Skipping paths directory because it already exists."
  fi

  echo ""
  if [[ $OSTYPE == "msys" ]]; then
      echo_warn 'Win32 Detected. Cant chmod here.'
  else
    for file in $(find ${BASHWF}/system/bin/ -type f)
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
