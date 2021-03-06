#!/bin/bash

if command_exists docker; then
  # http://www.kartar.net/2014/03/some-useful-docker-bash-functions-and-aliases/
  # Slightly modified
  # I like consistency use dk prefix for everything
  alias dk="docker"
  alias dkip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
  alias dkd="docker run -d -P"
  alias dki="docker run -t -i -P"
  dkrm() { docker rm $(docker ps -q -a); }
  dkri() { docker rmi $(docker images -q); }
  dkb() { docker build -t="$1" .; }
  # These are mine
  # Remove all untagged images
  function dkrn ()
  {
      for image in $(docker images | grep '<none>' | tr -s ' ' | cut -f3 -d ' ');
      do
          docker rmi $image;
      done
  }

  dksh()
  {
    if [ -z $1 ]; then
      echo "You didn't specify a container."
      return 1
    else
      docker exec -it $1 /bin/bash
    fi
  }

  alias dkps="docker ps"
  alias dkim="docker images"

fi
