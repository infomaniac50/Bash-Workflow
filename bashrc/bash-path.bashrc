if [[ -f ${HOME}/.bash_path ]]
then
    while read DIR
    do
        DIR=$(eval echo $DIR)
        if [[ -d $DIR ]]
        then
            PATH=$DIR:$PATH
        fi
    done
fi