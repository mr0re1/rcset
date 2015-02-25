export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

export GIT_PS1_SHOWUPSTREAM="auto"

source $__BASE_DIR/bash/tp/git-completion.bash
source $__BASE_DIR/bash/tp/git-prompt.sh

alias g='git'
__git_complete g __git_main

git_diff_commit() {
  local difftool=${3:-'vimdiff'}
  $difftool <(g show $1) <(g show $2)
}
alias gdcommit=git_diff_commit
