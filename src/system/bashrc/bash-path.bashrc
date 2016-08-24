#!/bin/bash
PATHFILE=$BASHWF/paths/global.txt
NEWPATH=""

if [ -f $PATHFILE ]; then
    while read DIR
    do
        DIR=$(eval echo $DIR)
        if [ -d $DIR ]
        then
            NEWPATH="$NEWPATH$DIR:"
        fi
    done < $PATHFILE
fi

PATH="$NEWPATH$PATH"

unset NEWPATH
unset PATHFILE
