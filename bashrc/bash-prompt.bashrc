
if [ "$color_prompt" = yes ]; then
    PS1='\n\[\033[00;32m\]\u@\h \[\033[00;33m\]\W'
else
    PS1='\n\u@\h \W'
fi

if command_exists "git"; then
    function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

    PS1=$PS1' $(parse_git_branch)'
fi

if [[ -n $UNICODE_WORKFLOW && $UNICODE_WORKFLOW == "TRUE" ]]; then
    # This is the lambda character from the Half-Life video game series.
    PROMPT_CHAR='\316\273'
else
    PROMPT_CHAR='$'
fi
if [ "$color_prompt" = yes ]; then
    PS1=$PS1'\[\033[0m\]'
fi

PS1="$PS1\n$PROMPT_CHAR "