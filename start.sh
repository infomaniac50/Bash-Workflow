#!/bin/bash

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

[ ! -f ~/.bash_path ] && cp .bash_path ~/
[ ! -f ~/.bash_path ] && cp .bash_path.opt ~/
cp .bashrc ~/
cp .bash_profile ~/