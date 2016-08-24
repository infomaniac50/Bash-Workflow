#!/bin/bash

# https://www.npmjs.com/package/bitbucket-cli

if command_exists bitbucket; then
  if [ -f "${HOME}/.bitbucket-cli" ]; then
    . "${HOME}/.bitbucket-cli"
  else
    echo "${HOME}/.bitbucket-cli not found"
  fi
  alias bb='bitbucket'
fi
