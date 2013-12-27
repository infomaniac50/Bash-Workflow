#!/bin/bash

cp -R bashrc/ ~/
cp -R functions/ ~/
cp -R bin/ ~/

while read line
do
    chmod u+x "${HOME}/bin/$line"
done < <(ls bin/)

cp .bash_path ~/
cp .bash_path.opt ~/
cp .bashrc ~/
cp .bash_profile ~/