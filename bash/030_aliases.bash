# Aliases

if [[ $OSTYPE == darwin* ]]; then
  alias ll='ls -lhG'
  alias lla='ls -AlhG'
else
  alias ll='ls -lh --color=auto'
  alias lla='ls -Alh --color=auto'
fi
alias l='ll'
alias la='lla'

alias c='cd'

alias sourcebashrc='source ~/.bashrc'

__cd_wp() {
  cd $WORKPLACE/$1
}

__wp_completition() {
  local cur prev list
  list=$(ls $WORKPLACE)
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "${list}" -- ${cur}) )
  return 0
}


alias wp='__cd_wp'
complete -o nospace -F __wp_completition wp


# vim aliases
alias v="vim"
alias vim_sh='vim -c ":set filetype=sh"'  # edit as a shell script (for scripts without extention)

# grep aliases
__grep_py() { grep -RIn "$1" --include="*.py" --color=auto .; }
alias grpy=__grep_ft

__grep_java() { grep -RIn "$1" --include="*.java" --color=auto .; }
alias grjava=__grep_java

# find alias
__find_by_name() {
  local place=${2:-"."}
  find $place -name "*$1*" 2> /dev/null
}
alias fnd=__find_by_name
