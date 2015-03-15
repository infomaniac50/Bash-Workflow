#!/bin/bash

function command_exists()
{
    hash "$1" 2>/dev/null
    return $?
}

function askyesno()
{
    local QUESTION=$1
    local ANSWER

    echo -n "$QUESTION [yes|no] "
    read ANSWER
    [[ $ANSWER == 'yes' || $ANSWER == 'y' ]];
    return $?;
}

function try_source_path()
{
    RELPATH="$1"
    EXTENSION="$2"

    MODULE_PATH="$BASHWF/${RELPATH}"

    # Load our bashrc modules if they exist
    if [[ -d "$MODULE_PATH" ]]; then

        for MODULE in $MODULE_PATH/*.$EXTENSION
        do
            MODULE_NAME=${MODULE##*/}
            MODULE_NAME=${MODULE_NAME%.*}
            echo -n "$MODULE_NAME: "
            source $MODULE
        done

    fi
}

export try_source_path
export askyesno
export command_exists
