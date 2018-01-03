###########
# Aliases #
###########
alias l="ls -1"
alias ll="ls -lG"
alias la="ls -laG"

# navigation to parent directories
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

# create non-existing parent directories automatically
alias mkdir='mkdir -pv'

alias grep="grep --color"

alias pull="git pull --rebase"

# replace Mac OSX "BSD-style" sleep with GNU sleep (installed from homebrew)
alias sleep="gsleep"

alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

alias docker-ls='docker ps --format "table{{.Names}}\t{{.Image}}\t{{.Status}}"'

alias tmux-pbcopy='tmux save-buffer - | pbcopy'
