#!/bin/bash

if command_exists ssh-agent; then

  SSHAGENT=`which ssh-agent`
  SSHAGENTARGS="-s"
  if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
  fi

fi