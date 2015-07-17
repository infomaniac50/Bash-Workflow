#!/bin/bash

if [[ $TERM == "linux" ]]; then
  # The linux console does not support unicode. Period!
  # Believe me I've tried. It's got too many hoops to jump through.
  UNICODE_WORKFLOW="FALSE"
fi
