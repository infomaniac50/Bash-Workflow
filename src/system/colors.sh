#!/bin/bash

# Text color variables
export txtred='\e[0;31m'       # red
export txtgrn='\e[0;32m'       # green
export txtylw='\e[0;33m'       # yellow
export txtblu='\e[0;34m'       # blue
export txtpur='\e[0;35m'       # purple
export txtcyn='\e[0;36m'       # cyan
export txtwht='\e[0;37m'       # white
export bldred='\e[1;31m'       # red    - Bold
export bldgrn='\e[1;32m'       # green
export bldylw='\e[1;33m'       # yellow
export bldblu='\e[1;34m'       # blue
export bldpur='\e[1;35m'       # purple
export bldcyn='\e[1;36m'       # cyan
export bldwht='\e[1;37m'       # white

# My SGS3 Android OS doesn't have tput. If you've got it good for you.
if command_exists tput; then
  export txtund
  export txtbld
  txtund=$(tput sgr 0 1)  # Underline
  txtbld=$(tput bold)     # Bold
fi

export txtrst='\e[0m'          # Text reset

# Feedback indicators
echo_info()
{
  printf "${bldcyn}%s${txtrst}\n" "$*"
}

echo_pass()
{
  printf "${bldblu}%s${txtrst}\n" "$*"
}

echo_fail()
{
  printf "${bldred}%s${txtrst}\n" "$*"
}

echo_warn()
{
  printf "${bldylw}%s${txtrst}\n" "$*"
}
