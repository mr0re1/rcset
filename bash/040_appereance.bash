export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Prompt
_R="\e[38;5;160m"
_G="\e[38;5;70m"
_B="\e[38;5;104m"
_0="\e[0m"

export PS1="$_B $COMPUTER_NAME \w $_0 $_G\$(__git_ps1)$_0
\$ "


