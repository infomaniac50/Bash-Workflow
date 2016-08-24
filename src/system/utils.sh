#!/bin/bash

command_exists()
{
    hash "$1" 2>/dev/null
    return $?
}

askyesno()
{
    local QUESTION=$1
    local ANSWER

    printf "%s [yes|no] " $QUESTION
    read ANSWER
    if [ $ANSWER = 'yes' -o $ANSWER = 'y' ]; then
        return 0
    else
        return 1
    fi
}

try_source_path()
{
    RELPATH="$1"
    EXTENSION="$2"

    SYS_MODULE_PATH="$BASHWF_SYS/${RELPATH}"

    # Load our bashrc modules if they exist
    if [ -d "$SYS_MODULE_PATH" ]; then

        for MODULE in $SYS_MODULE_PATH/*.$EXTENSION
        do
            MODULE_NAME=${MODULE##*/}
            MODULE_NAME=${MODULE_NAME%.*}
            printf "%s: " $MODULE_NAME
            . $MODULE
        done

    fi

    USER_MODULE_PATH="$BASHWF_USER/${RELPATH}"

    # Load our bashrc modules if they exist
    if [ -d "$USER_MODULE_PATH" ]; then

        for MODULE in $USER_MODULE_PATH/*.$EXTENSION
        do
            MODULE_NAME=${MODULE##*/}
            MODULE_NAME=${MODULE_NAME%.*}
            printf "%s: " $MODULE_NAME
            . $MODULE
        done

    fi
}

export try_source_path
export askyesno
export command_exists
