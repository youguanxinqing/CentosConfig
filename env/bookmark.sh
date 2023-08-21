# bash directory bookmark
function cd_mark() {
    MARKPATH="${MARKPATH:-$HOME/.local/share/marks}"
    [ -d "$MARKPATH" ] || mkdir -p -m 700 "$MARKPATH" 2> /dev/null
    case "$1" in
        +*)            # m +foo  - add new bookmark for $PWD
            ln -snf "$(pwd)" "$MARKPATH/${1:1}" 
            ;;
        -*)            # m -foo  - delete a bookmark named "foo"
            rm -i "$MARKPATH/${1:1}" 
            ;;
        /*)            # m /bar  - search bookmarks matching "bar"
            find "$MARKPATH" -type l -name "*${1:1}*" | \
                awk -F "/" '{print $NF}' | MARKPATH="$MARKPATH" xargs -I'{}'\
                sh -c 'echo "{} ->" $(readlink "$MARKPATH/{}")'
            ;;
        "")            # m       - list all bookmarks
            command ls -1 "$MARKPATH/" | MARKPATH="$MARKPATH" xargs -I'{}' \
                sh -c 'echo "{} ->" $(readlink "$MARKPATH/{}")'
            ;;
        *)             # m foo   - cd to the bookmark directory
            local dest="$(readlink "$MARKPATH/$1" 2> /dev/null)"
            [ -d "$dest" ] && cd "$dest" || echo "No such mark: $1"
            ;;
    esac
}

# by default, alias cd_mark to m
alias ${MARKCMD:-m}='cd_mark'
