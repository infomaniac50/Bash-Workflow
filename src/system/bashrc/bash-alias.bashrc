#!/bin/bash

if [ -z $OSTYPE ]; then

if [ "$(uname)" = "Darwin" ]; then
  # Do something under Mac OS X platform
    OSTYPE="darwin";
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # Do something under GNU/Linux platform
    OSTYPE="linux-gnu"
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    OSTYPE="msys"
fi

fi

bashos=$(echo $OSTYPE | sed s/darwin.*/darwin/)
if [ $bashos != "msys" ]; then
    # Don't alias this on Windows as it causes problems with the native ping.
    alias fastping='ping -c 100 -i .2'
    alias ping='ping -c 5'
fi

# Mac check
if [ $bashos = "darwin" ]; then
  # BSD uses environment variables
  export CLICOLOR=1
  export LSCOLORS="gxfxcxdxbxegedabagacad"
else
  # BSD doesn't have the --color arg.
  alias ls='ls --color=auto'
fi

alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ..'
alias cd..='cd ..'
alias cold='cd $OLDPWD'
alias la='ls -la'
alias ll='ls -l'
alias lh='ls -lh'
alias dush='du -sh *'

alias lsdir='ls -d */'
alias lmount='mount | column -t'
alias ports='netstat -tulanp'
alias zlist='tar --list -zf'

# Current 24 hour time
alias now='date +"%T"'
# Current unix timestamp
alias stamp='date +"%s"'

# Archival rsync
alias arsync='rsync --recursive --links --perms --devices --specials --times --protect-args --human-readable --partial --progress --itemize-changes --stats'

# Sublimish reveal command
# Mostly used like reveal ./; # This opens the current directory in the file browser
if command_exists exo-open; then
  alias reveal='exo-open'
fi
