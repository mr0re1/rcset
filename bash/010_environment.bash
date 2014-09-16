[ -z "$COMPUTER_NAME" ] && export COMPUTER_NAME="$HOSTNAME"


if [ -z "$WORKPLACE" ]; then
  export WORKPLACE="~"
  for C in "/workplace" "~/workplace"; do
    [ -d "$C" ] && export WORKPLACE="$C"
  done
fi


[ -d "/usr/local/bin/" ] && export PATH="/usr/local/bin/:$PATH"
