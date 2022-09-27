# Aliases

## Docker
alias d="docker"
complete -F _docker docker d
alias dcp="docker-compose"
complete -F _docker_compose docker-compose dcp
alias dls="docker container ls -a --format 'table {{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Names}}'"
alias dlsize="docker container ls -a --format 'table {{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Names}}\t{{.Size}}'"
alias dils="docker image ls"
alias dilsa="docker image ls -a"
alias fixDocker="sudo systemctl restart NetworkManager docker"
alias fixDockerDanglingImages="docker image rm $(docker image ls --filter 'dangling=true' -q --no-trunc)"

## Kubernetes
alias k="kubectl"
complete -F __start_kubectl k
alias m="minikube"
complete -F __start_minikube m
alias h="helm"
complete -F __start_helm h

## InteliJ IDEA

alias idea="/opt/intellij-idea/bin/idea.sh"

## MP VM

alias cleanVm="~/projects/vm-tips/scripts/cleanVm.sh"
alias shrinkVm="~/projects/vm-tips/scripts/shrinkVm.sh"
alias versions="~/projects/vm-tips/scripts/versions.sh"

## Maven

alias buildClasspath="mvn dependency:build-classpath"
alias dependencyTree="mvn dependency:tree"
alias effectivePom="mvn help:effective-pom"
alias m2="sudo gedit ~/.m2/settings.xml &"

## Ubuntu

alias bashrc="sudo gedit ~/.bashrc &"
alias bashaliases="sudo gedit ~/.bash_aliases &"
alias checkInternet="nmcli device"
alias clear="tput reset"
alias fixInternet="sudo systemctl restart NetworkManager"
alias hosts="sudo gedit /etc/hosts &"
alias largestdir='sudo du -cks .[!.]* * | sort -nr | head $@'
alias largestfile='sudo find . -type f -printf "%s %p\n" | sort -nr | head $@'
alias src="cd ~/projects"
alias terminator="terminator --title 'Terminal'"

## Vim
alias vi="nvim"
alias vim="nvim"
alias vimtutor="vi /usr/share/vim/vim81/tutor/tutor.pl.utf-8"