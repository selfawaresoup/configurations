source $LIB_DIR/bash/colors.sh


# Various variables you might want for your PS1 prompt instead
User="\u"
Host="\h"
Time="\t"
PathShort="\w"
HistoryId="\!"

PROMPT_DIRTRIM=3

GIT_BRANCH=""
# function to refresh the git variables
function update_current_git_vars() {
    GIT_BRANCH=$(git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
}
GIT_BRANCH=""

# function to refresh the git variables
function update_current_git_vars() {
    GIT_BRANCH=$(git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
}
function setPrompt() {
    LastReturn=$?
    update_current_git_vars

    GIT_STATUS=""

    if [ $LastReturn -eq 0 ]; then
        ReturnColor="Green"
    else
        ReturnColor="Red"
    fi

    LastReturn=$(colorize $LastReturn $ReturnColor)

    if [ -n "$GIT_BRANCH" ]; then
        GIT_STATUS=$GIT_STATUS$GIT_BRANCH
    fi

    if [ $(id -u) -eq 0 ];
    then
        # user is root, better be red and show a "#"
        PROMPT_END="# "
        USER_HOST="$(colorize $User@$Host Red)"
    else
        USER_HOST="$(colorize $User@$Host Cyan)"
        PROMPT_END="$ "
    fi

    PROMPT_START="# $(colorize $Time Blue) $LastReturn $HistoryId $USER_HOST:$PathShort"

    if [ -n "$GIT_STATUS" ]; then
        PS1="$PROMPT_START $(colorize \($GIT_STATUS\) Green) $PROMPT_END"
    else
        PS1="$PROMPT_START $PROMPT_END"
    fi

    set_terminal_title
}

PROMPT_COMMAND="setPrompt; $PROMPT_COMMAND"
