# If OS is OSX ...
if [[ `uname` == 'Darwin' ]]; then
  # Load default docker-machine
  eval $(docker-machine env default)
fi
