
if [ -n "$force_color_prompt" ]; then
    color_prompt=yes
    unset force_color_prompt;
fi

if command_exists "git"; then
    function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' 
    }

    if [ "$color_prompt" = yes ]; then
        PS1='\n\[\033[00;32m\]\u@\h \[\033[00;33m\]\W $(parse_git_branch)\[\033[0m\]\n$ '
    else
        PS1='\n\u@\h \W $(parse_git_branch)\n\$ '
    fi
else
    if [ "$color_prompt" = yes ]; then
        PS1='\n\[\033[00;32m\]\u@\h \[\033[00;33m\]\W \[\033[0m\]\n$ '
    else
        PS1='\n\u@\h \W \n\$ '
    fi
fi
