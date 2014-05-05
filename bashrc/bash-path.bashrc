PATHFILE=$BASHWF/paths/global.txt

if [[ -f $PATHFILE ]]; then
    while read DIR
    do
        DIR=$(eval echo $DIR)
        if [[ -d $DIR ]]
        then
            PATH=$PATH:$DIR
        fi
    done < $PATHFILE
fi