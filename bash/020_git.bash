export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

export GIT_PS1_SHOWUPSTREAM="auto"

source $__BASE_DIR/bash/tp/git-completion.bash
source $__BASE_DIR/bash/tp/git-prompt.sh

alias gl='git lg'
alias gs='git status -s'
alias gd='git diff'
