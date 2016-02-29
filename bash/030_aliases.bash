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

alias Rm='rm -rf'

alias jarls='jar -tvf'

__jar_fnd() {
  local ptrn="$1"
  for jar in $(find . -name "*.jar"); do
    local res=$(jarls $jar | grep "$ptrn")
    if [[ -n "$res" ]]; then
      echo "$jar:"
      echo "$res"
    fi
  done
}
alias jarfnd=__jar_fnd

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
__grep_py() { grep -sRIn "$1" --include="*.py" --color=auto .; }
alias grpy=__grep_py

__grep_java() { grep -sRIn "$1" --include="*.java" --color=auto .; }
alias grjava=__grep_java

__grep_pom() { grep -sRIn "$1" --include="pom.xml" --color=auto .; }
alias grpom=__grep_pom

__grep_sh() { grep -sRIn "$1" --include="*sh" --color=auto .; }
alias grsh=__grep_sh

__grep_puppet() { grep -sRIn "$1" --include="*.pp" --color=auto .; }
alias grpp=__grep_puppet

__grep_xml() { grep -sRIn "$1" --include="*.xml" --color=auto .; }
alias grxml=__grep_xml


__grep_recursive() {
  local place=${2:-"."}
  grep -siRIn --color=auto "$1" "$place"
}
alias gR=__grep_recursive

alias gr='grep --color=auto -iI'

# find alias
__find_by_name() {
  local place=${2:-"."}
  find $place -name "*$1*" 2> /dev/null
}
alias fnd=__find_by_name



# tools
__gfm() {
  local gfm_css=${1:-"$__BASE_DIR/resources/github-markdown.css"}
  echo "<html>"
  if [ -f "$gfm_css" ]; then
    echo "<style>"
    cat $gfm_css
    echo ".markdown-body { min-width: 200px; max-width: 790px; margin: 0 auto; padding: 30px; }"
    echo "</style>"
  fi
  echo "<article class='markdown-body'>"
  curl -X POST https://api.github.com/markdown/raw --data-binary @- -H "Content-type:text/plain"
  echo "</article></html>"
}
alias gfm=__gfm

alias ipynote="jupyter notebook"

if [[ $OSTYPE == darwin* ]]; then
  # Remove formating from buffer text
  alias pbclean='pbpaste | pbcopy'
fi


alias mvnskiptests='mvn -DskipTests=true'
