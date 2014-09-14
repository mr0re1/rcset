export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Prompt
__prompt_command() {
  local _R="\e[38;5;160m"
  local _G="\e[38;5;70m"
  local _B="\e[38;5;104m"
  local _0="\e[0m"

  local path=${1:-$(pwd)}
  local pkg=''
  if [[ $path == $WORKPLACE* ]]; then
    path=$(echo $path | sed -e "s#$WORKPLACE/##")
    pkg=$(echo $path | sed -e "s#/.*##")
    if [ -n $pkg ]; then
      path=$(echo $path | sed -e "s#$pkg/*##")
      path="$_G$pkg$_0 $path"
    fi
  fi
  export PS1="$_B $COMPUTER_NAME$_0 $path $_G$(__git_ps1)$_0
\$ "
}

export PROMPT_COMMAND="__prompt_command"

