if [[ -f ${HOME}/.bash_path ]]
then
    for DIR in $(cat ${HOME}/.bash_path)
    do
        DIR="${DIR/#~/${HOME}}"
        if [[ -d $DIR ]]
        then
            PATH=$DIR:$PATH
        fi
    done
fi