#!/bin/bash
#!/bin/bash

# Text color variables
txtred=''       # red
txtgrn=''       # green
txtylw=''       # yellow
txtblu=''       # blue
txtpur=''       # purple
txtcyn=''       # cyan
txtwht=''       # white
bldred=''       # red    - Bold
bldgrn=''       # green
bldylw=''       # yellow
bldblu=''       # blue
bldpur=''       # purple
bldcyn=''       # cyan
bldwht=''       # white
txtund=''  # Underline
txtbld=''     # Bold
txtrst=''          # Text reset

# Feedback indicators
info=${bldcyn}*${txtrst}
pass=${bldblu}*${txtrst}
fail=${bldred}!${txtrst}
warn=${bldylw}!${txtrst}

# Feedback indicators
function echo_info()
{
  echo -e "$*"
}

function echo_pass()
{
  echo -e "$*"
}

function echo_fail()
{
  echo -e "$*"
}

function echo_warn()
{
  echo -e "$*"
}
