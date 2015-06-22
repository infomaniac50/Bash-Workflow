#!/bin/bash

# If a color prompt does not exist then the color variables are just empty strings.
PS1='\n'${txtgrn}'\u@\h '${txtylw}'\W'

if command_exists "git"; then
    function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

    PS1=$PS1' `parse_git_branch`'
fi

if [[ -n $UNICODE_WORKFLOW && $UNICODE_WORKFLOW == "TRUE" ]]; then
    # This is the lambda character from the Half-Life video game series.
    PROMPT_CHAR='\316\273'
else
    PROMPT_CHAR='$'
fi

PS1=$PS1${txtrst}

PS1="$PS1\n$PROMPT_CHAR "