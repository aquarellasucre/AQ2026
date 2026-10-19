# This works even with really weird filenames like $'--$`\! *@ \a\b\e\E\f\n\r\t\v\\\"\' '
file_count()
{
    if [ ! -e "$1" ]
    then
        exit 1
    fi

    local -i files=$(find "$(readlink -f -- "$1")" -type f -print0 | grep -cz -- -)
    echo $files
}
