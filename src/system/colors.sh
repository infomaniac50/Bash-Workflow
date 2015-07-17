#!/bin/bash

# Text color variables
txtred='\e[0;31m'       # red
txtgrn='\e[0;32m'       # green
txtylw='\e[0;33m'       # yellow
txtblu='\e[0;34m'       # blue
txtpur='\e[0;35m'       # purple
txtcyn='\e[0;36m'       # cyan
txtwht='\e[0;37m'       # white
bldred='\e[1;31m'       # red    - Bold
bldgrn='\e[1;32m'       # green
bldylw='\e[1;33m'       # yellow
bldblu='\e[1;34m'       # blue
bldpur='\e[1;35m'       # purple
bldcyn='\e[1;36m'       # cyan
bldwht='\e[1;37m'       # white

# My SGS3 Android OS doesn't have tput. If you've got it good for you.
if command_exists tput; then
  txtund=$(tput sgr 0 1)  # Underline
  txtbld=$(tput bold)     # Bold
fi

txtrst='\e[0m'          # Text reset

# Feedback indicators
info=${bldcyn}*${txtrst}
pass=${bldblu}*${txtrst}
fail=${bldred}!${txtrst}
warn=${bldylw}!${txtrst}

# Feedback indicators
function echo_info()
{
	echo -e "${bldcyn}$*${txtrst}"
}

function echo_pass()
{
	echo -e "${bldblu}$*${txtrst}"
}

function echo_fail()
{
	echo -e "${bldred}$*${txtrst}"
}

function echo_warn()
{
	echo -e "${bldylw}$*${txtrst}"
}
