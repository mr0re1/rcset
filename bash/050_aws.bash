awswhoami() {
  user=$(python2.7 -c 'import boto; \
user = boto.connect_iam().get_user()["get_user_response"]["get_user_result"]["user"]; \
print user["user_name"] if "user_name" in user else user["arn"]')
  echo "$user"
}


setawscredentials() {
  export AWS_ACCESS_KEY_ID="$1"
  export AWS_SECRET_ACCESS_KEY="$2"

  export AWS_ACCESS_KEY=$AWS_ACCESS_KEY_ID
  export AWS_SECRET_KEY=$AWS_SECRET_ACCESS_KEY

  # TODO: do it in background
  # export AWS_USER_NAME=$(awswhoami)
}


setawsprofile() {
  export AWS_DEFAULT_PROFILE="$1"
}

alias s3='aws s3'
alias ec2='aws ec2'
alias edp='aws datapipeline'
