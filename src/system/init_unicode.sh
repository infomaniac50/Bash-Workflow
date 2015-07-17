#!/bin/bash

if [[ $TERM == "linux" ]]; then
  # The linux console does not support unicode. Period!
  UNICODE_WORKFLOW="FALSE"
fi
