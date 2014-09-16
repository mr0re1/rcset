# Aliases

alias ll='ls -lhG --color=auto'
alias lla='ls -alhG --color=auto'

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
