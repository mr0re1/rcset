__dirname(){
  echo $(cd -P $(dirname $1) && pwd)
}


__lookup_path(){
  local path=$1
  local dir=''
  while [ -h $path ]; do
    dir=$(__dirname $path)
    path=$(readlink $path)
    [[ $path != /* ]] && path="$dir/$path"
  done
  echo $path
}

export __BASE_DIR=$(__dirname $(__lookup_path ${BASH_SOURCE[0]}))

for f in $__BASE_DIR/bash/*.bash; do
  source $f
done
