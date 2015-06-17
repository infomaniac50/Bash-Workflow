#!/bin/bash

if command_exists xclip; then
  alias xcopy='xclip -i -selection clipboard'
  alias xpaste='xclip -o -selection clipboard'
fi

