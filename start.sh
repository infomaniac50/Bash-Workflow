#!/bin/bash

chmod u+x bin/*

cp -R bashrc/ ~/
cp -R functions/ ~/
cp -R bin/ ~/

cp .bash_path ~/
cp .bash_path.opt ~/
cp .bashrc ~/
cp .bash_profile ~/