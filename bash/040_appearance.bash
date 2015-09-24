export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


_R="\e[38;5;160m"
_G="\e[38;5;70m"
_B="\e[38;5;104m"
_O="\e[38;5;208m"
_0="\e[0m"

_HOME=$(cd ~ && pwd)

# Prompt
__prompt_command() {
  [ -z "$__NAME_COLOR" ] && __NAME_COLOR=$__O

  local path=${1:-$(pwd)}
  local pkg=''

  if [[ $path == $WORKPLACE* ]]; then
    path=$(echo $path | sed -e "s#$WORKPLACE/##")
    pkg=$(echo $path | sed -e "s#/.*##")
    if [[ -n $pkg ]]; then
      path=$(echo $path | sed -e "s#$pkg/*##")
      path="$_G$pkg$_0 $path"
    fi
  elif [[ $path == $_HOME* ]]; then
    path="$_R~$_0$(echo $path | sed -e "s#$_HOME##")"
  fi

  local status=""

  local git_st=$(__git_ps1)
  [ -n "$git_st" ] && status="$status $_G$git_st$_0"

  [ -n "$EMR_FLOW_ID" ] && status="$status $_O[$EMR_FLOW_ID]$_0"

  [ -n "$AWS_DEFAULT_PROFILE" ] && status="$status $_R<$AWS_DEFAULT_PROFILE>$_0"

  export PS1="$__NAME_COLOR $COMPUTER_NAME$_0 $path $status
\$ "
}

export PROMPT_COMMAND="__prompt_command"

