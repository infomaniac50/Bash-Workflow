#!/bin/bash

function setup_bash()
{
  file_list="bashwf colors.sh config.sh init.sh init_colors.sh init_unicode.sh nocolors.sh utils.sh"
  folder_list="bashrc bin functions"

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
    cp_folder paths
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
