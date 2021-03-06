#!/bin/bash

# # If we are not in our home directory cd to it.
# if [[ "$(pwd)" != "${HOME}" ]]; then
#     cd "${HOME}"
# fi

color_prompt=no

pretty_terminal_list="cygwin xterm xterm-color"

for terminal in $pretty_terminal_list; do
  if [ $TERM = "$terminal" ]; then
    color_prompt=yes
  fi
done

if [ -n $FORCE_COLOR_WORKFLOW -a $FORCE_COLOR_WORKFLOW = "TRUE" ]; then
  color_prompt=yes
  unset FORCE_COLOR_WORKFLOW;
fi

if [ $color_prompt = "yes" ]; then
  . "$BASHWF_SYS/colors.sh"
else
  . "$BASHWF_SYS/nocolors.sh"
fi
