#!/bin/bash

# # If we are not in our home directory cd to it.
# if [[ "$(pwd)" != "${HOME}" ]]; then
#     cd "${HOME}"
# fi

echo ""
echo_info "Loading Bash Modules"
try_source_path "bashrc" "bashrc"

echo ""
echo_info "Loading Bash Functions"
try_source_path "functions" "func"

echo ""
