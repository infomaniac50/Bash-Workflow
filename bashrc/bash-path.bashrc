PATHFILE=${HOME}/.bash_path

if [[ -f $PATHFILE ]]; then
    while read DIR
    do
        DIR=$(eval echo $DIR)
        if [[ -d $DIR ]]
        then
            PATH=$DIR:$PATH
        fi
    done < $PATHFILE
fi