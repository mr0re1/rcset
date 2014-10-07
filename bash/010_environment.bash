[ -z "$COMPUTER_NAME" ] && export COMPUTER_NAME="$HOSTNAME"


if [ -z "$WORKPLACE" ]; then
  export WORKPLACE="~"
  for C in "/workplace" "~/workplace"; do
    [ -d "$C" ] && export WORKPLACE="$C"
  done
fi


[ -d "/usr/local/bin/" ] && export PATH="/usr/local/bin/:$PATH"


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
