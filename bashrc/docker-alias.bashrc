
# http://www.kartar.net/2014/03/some-useful-docker-bash-functions-and-aliases/
# Slightly modified
alias dk="docker"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dkd="docker run -d -P"
alias dki="docker run -t -i -P"
drm() { docker rm $(docker ps -q -a); }
dri() { docker rmi $(docker images -q); }
dkb() { docker build -t="$1" .; }