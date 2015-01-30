
if [[ $OSTYPE != "msys" ]]; then
    # Don't alias this on Windows as it causes problems with the native ping.
    alias fastping='ping -c 100 -i .2'
    alias ping='ping -c 5'
fi

# Mac check
if [[ $OSTYPE == darwin* ]]; then
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

