
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

alias lsdir='ls -d */'
alias lmount='mount | column -t'
alias now='date +"%T"'
alias ports='netstat -tulanp'
alias v:h='vagrant halt'
alias v:p='vagrant suspend'
alias v:s='vagrant ssh'
alias v:u='vagrant up'
alias zlist='tar --list -zf'

