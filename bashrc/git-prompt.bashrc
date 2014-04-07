
if [ -n $FORCE_COLOR_WORKFLOW && $FORCE_COLOR_WORKFLOW == "TRUE" ]; then
    color_prompt=yes
    unset FORCE_COLOR_WORKFLOW;
fi

if command_exists "git"; then
    function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

    if [ "$color_prompt" = yes ]; then
        PS1='\n\[\033[00;32m\]\u@\h \[\033[00;33m\]\W $(parse_git_branch)\[\033[0m\]\n'
    else
        PS1='\n\u@\h \W $(parse_git_branch)\n'
    fi
else
    if [ "$color_prompt" = yes ]; then
        PS1='\n\[\033[00;32m\]\u@\h \[\033[00;33m\]\W\[\033[0m\]\n'
    else
        PS1='\n\u@\h \W\n'
    fi
fi

if [[ -n $UNICODE_WORKFLOW && $UNICODE_WORKFLOW == "TRUE" ]]; then
    PROMPT_CHAR='\316\273'
else
    PROMPT_CHAR='$'
fi

PS1="$PS1$PROMPT_CHAR "