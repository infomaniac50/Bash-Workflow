#!/bin/bash

# https://www.npmjs.com/package/bitbucket-cli

if command_exists bitbucket; then
  if [[ -f ~/.bitbucket-cli ]]; then
    source ~/.bitbucket-cli
  else
    echo "~/.bitbucket-cli not found"
  fi
  alias bb='bitbucket'
fi
