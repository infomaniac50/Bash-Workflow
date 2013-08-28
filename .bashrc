# If we are not in our home directory cd to it.
if [[ "$(pwd)" != "${HOME}" ]]
then 
    cd "${HOME}"
fi

# Use new lines as argument separators
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Load our bashrc modules if they exist
if [[ -d ${HOME}/bashrc ]]
then
    echo "Loading BASHRC Modules"
    echo ""

    for BASHRC in $(ls -1 ${HOME}/bashrc/)
    do
        MODULE="${HOME}/bashrc/$BASHRC"
        echo "$BASHRC"
        source $MODULE
    done
fi

# Restore old argument separator
IFS=$SAVEIFS

# Let the new shell use our PATH
export PATH