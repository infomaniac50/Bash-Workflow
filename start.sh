#!/bin/bash

BASHWF="${HOME}/bashwf"

echo ""

function cp_rename()
{
    if [[ ! -f $2/$1 ]]; then
        cp $1 $2/$1
    else
        cp $1 $2/$1.new
        echo $1 exists copying as $1.new
    fi
}

if [[ ! -d $BASHWF ]]; then
    mkdir $BASHWF
fi

cp -R bashrc/ $BASHWF/
cp -R functions/ $BASHWF/
cp -R bin/ $BASHWF/

if [[ $OSTYPE == "msys" ]]; then
    echo 'Win32 Detected. Cant chmod here.'
else
    while read line
    do
        chmod u+x "${BASHWF}/bin/$line"
    done < <(ls bin/)
fi

echo ""
cp_rename bashwf $BASHWF
cp_rename bashwf_config $BASHWF

echo "
Use can use this function to quickly load bash workflow.
Just insert it into your .profile/.bashrc/shell specific init file you use.

function wf()
{
  source \${HOME}/bashwf/bashwf
}
"