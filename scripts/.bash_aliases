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
alias dnls="docker network ls"
alias dvls="docker volume ls"
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

alias mvnBuildClasspath="mvn dependency:build-classpath"
alias mvnDependencyTree="mvn dependency:tree"
alias mvnEffectivePom="mvn help:effective-pom"
alias mvnSourcesJavadoc="mvn dependency:sources dependency:resolve -Dclassifier=javadoc"
alias m2="code ~/.m2/settings.xml"

## Ubuntu

alias bashrc="code ~/.bashrc"
alias bashaliases="code ~/.bash_aliases"
alias checkInternet="nmcli device"
alias clear="tput reset"
alias fixInternet="sudo systemctl restart NetworkManager"
alias hosts="sudo gedit /etc/hosts &"
alias largestdir='sudo du -hs --threshold=100M ?(.)[!.]* | sort -hr | head -n 15'
alias largestfile='sudo find . -type f -size +100M -exec du -h '{}' + | sort -hr | head -n 15'
alias src="cd ~/projects"
alias terminator="terminator --title 'Terminal'"

## Vim
alias vi="nvim"
alias vim="nvim"
alias vimtutor="vi /usr/share/vim/vim81/tutor/tutor.pl.utf-8"