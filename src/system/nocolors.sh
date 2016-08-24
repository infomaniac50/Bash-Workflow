#!/bin/bash

# Text color variables
export txtred=''       # red
export txtgrn=''       # green
export txtylw=''       # yellow
export txtblu=''       # blue
export txtpur=''       # purple
export txtcyn=''       # cyan
export txtwht=''       # white
export bldred=''       # red    - Bold
export bldgrn=''       # green
export bldylw=''       # yellow
export bldblu=''       # blue
export bldpur=''       # purple
export bldcyn=''       # cyan
export bldwht=''       # white
export txtund=''  # Underline
export txtbld=''     # Bold
export txtrst=''          # Text reset

# Feedback indicators
export info="${bldcyn}*${txtrst}"
export pass="${bldblu}*${txtrst}"
export fail="${bldred}!${txtrst}"
export warn="${bldylw}!${txtrst}"

# Feedback indicators
echo_info()
{
  echo -e "$*"
}

echo_pass()
{
  echo -e "$*"
}

echo_fail()
{
  echo -e "$*"
}

echo_warn()
{
  echo -e "$*"
}
