alias ls='ls --color=auto'

PATH=${HOME}/bin/git-ftp:$PATH

SSHAGENT=`which ssh-agent`
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
  eval `$SSHAGENT $SSHAGENTARGS`
  trap "kill $SSH_AGENT_PID" 0
fi

function gi() { curl http://gitignore.io/api/$@ ;}
