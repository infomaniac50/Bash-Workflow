
if [[ $OSTYPE != "msys" ]]; then
    # Don't alias this on Windows as it causes problems with the native ping.
    alias fastping='ping -c 100 -i .2'
    alias ping='ping -c 5'
fi

alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ..'
alias cd..='cd ..'
alias cold='cd $OLDPWD'
alias la='ls -la'
alias ll='ls -l'
alias ls='ls --color=auto'
alias lsdir='ls -d */'
alias mount='mount | column -t'
alias now='date +"%T"'
alias ports='netstat -tulanp'
alias v:h='vagrant halt'
alias v:p='vagrant suspend'
alias v:s='vagrant ssh'
alias v:u='vagrant up'
alias zlist='tar --list -zf'
