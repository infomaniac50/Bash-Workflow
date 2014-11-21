
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
alias dkps="docker ps"
alias dkim="docker images"