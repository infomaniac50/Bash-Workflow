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

function cp_folder()
{
  if [[ ! -d $BASHWF/$1 ]]; then
    mkdir $BASHWF/$1
  fi

  cp -R $1/* $BASHWF/$1/
}

# Create the bashwf directory if it doesn't exist.
if [[ ! -d $BASHWF ]]; then
    mkdir $BASHWF
fi

cp_folder bashrc
cp_folder functions
cp_folder bin

# Don't overwrite the path folder if it already exists.
if [[ ! -d $BASHWF/paths/ ]]; then
  cp -R paths/ $BASHWF/
fi

if [[ $OSTYPE == "msys" ]]; then
    echo 'Win32 Detected. Cant chmod here.'
else
  for FILE in $(find ${BASHWF}/bin/ -type f)
  do
    chmod u+x "$FILE"
  done
fi

echo ""
cp_rename bashwf $BASHWF
cp_rename config $BASHWF

echo "
Use can use this function to quickly load bash workflow.
Just insert it into your .profile/.bashrc/shell specific init file you use.

function wf()
{
  source \${HOME}/bashwf/bashwf
}
"