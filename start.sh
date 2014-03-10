#!/bin/bash

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

cp -R bashrc/ ~/
cp -R functions/ ~/
cp -R bin/ ~/

if [[ $OSTYPE == "msys" ]]; then
    echo 'Win32 Detected. Cant chmod here.'
else
    while read line
    do
        chmod u+x "${HOME}/bin/$line"
    done < <(ls bin/)
fi

echo ""
cp_rename .bash_path ~
cp_rename .bash_path.opt ~
cp_rename bashwf ~

echo "
Use can use this function to quickly load bash workflow.
Just insert it into your .profile/.bashrc/shell specific init file you use.

function wf()
{
  source ~/bashwf
}
"