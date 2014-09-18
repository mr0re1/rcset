# Aliases

if [[ $OSTYPE == darwin* ]]; then
  alias ll='ls -lhG'
  alias lla='ls -alhG'
else
  alias ll='ls -lh --color=auto'
  alias lla='ls -alh --color=auto'
fi

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
alias vim_sh='vim -c ":set filetype=sh"'  # edit as a shell script (for scripts without extention)
