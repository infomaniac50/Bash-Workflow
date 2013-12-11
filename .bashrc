# If we are not in our home directory cd to it.
if [[ "$(pwd)" != "${HOME}" ]]; then 
    cd "${HOME}"
fi

function try_source_path()
{
    RELPATH="$1"
    EXTENSION="$2"

    MODULE_PATH="${HOME}/${RELPATH}"

    # Load our bashrc modules if they exist
    if [[ -d "$MODULE_PATH" ]]; then
        ls -1 $MODULE_PATH/*.$EXTENSION > /tmp/bashmod.tmp

        while read MODULE
        do
            MODULE_NAME=${MODULE##*/}
            MODULE_NAME=${MODULE_NAME%.*}
            echo -n "$MODULE_NAME: "
            source $MODULE
        done < /tmp/bashmod.tmp

        rm -f /tmp/bashmod.tmp
    fi
}

echo ""
echo "Loading Bash Modules"
try_source_path "bashrc" "bashrc"

echo ""
echo "Loading Bash Functions"
try_source_path "functions" "func"

echo ""
# Let the new shell use our PATH
export PATH