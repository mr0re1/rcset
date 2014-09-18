if [ -n "$EMR_HOME" ]; then
  source $__BASE_DIR/bash/tp/bash-emr.sh
fi

awswhoami() {
  user=$(python2.7 -c 'import boto; \
print boto.connect_iam().get_user()["get_user_response"]["get_user_result"]["user"]["user_name"]')
  echo "$user"
}


setawscredentials() {
  export AWS_ACCESS_KEY_ID="$1"
  export AWS_SECRET_ACCESS_KEY="$2"

  export AWS_ACCESS_KEY=$AWS_ACCESS_KEY_ID
  export AWS_SECRET_KEY=$AWS_SECRET_ACCESS_KEY

  # TODO: do it in background
  export AWS_USER_NAME=$(awswhoami)
}
