<!-- TOC -->
* [Git](#git)
  * [Install `git`](#install-git)
  * [Install `git-lfs`](#install-git-lfs)
  * [Configure `git`](#configure-git)
  * [Configure GitHub token](#configure-github-token)
* [SdkMan and dependencies](#sdkman-and-dependencies)
  * [Install `sdk`](#install-sdk)
  * [Update `sdk`](#update-sdk)
  * [Enable `sdk` auto-completion](#enable-sdk-auto-completion)
  * [Configure `sdk`](#configure-sdk)
  * [Dependencies](#dependencies)
    * [Install/Update `maven`](#installupdate-maven)
    * [Install/Update `java`](#installupdate-java)
    * [Install/Update `spring` - Spring Boot CLI](#installupdate-spring---spring-boot-cli)
* [IntelliJ IDEA Community](#intellij-idea-community)
  * [Install IntelliJ IDEA Community](#install-intellij-idea-community)
  * [Update IntelliJ IDEA Community](#update-intellij-idea-community)
  * [Add IntelliJ IDEA Community to dock](#add-intellij-idea-community-to-dock)
  * [Configure IntelliJ IDEA Community](#configure-intellij-idea-community)
* [Postman](#postman)
  * [Install Postman](#install-postman)
  * [Update Postman](#update-postman)
  * [Add Postman to dock](#add-postman-to-dock)
* [Kafka](#kafka)
  * [Install/Update Kafka](#installupdate-kafka)
* [Tomcat](#tomcat)
  * [Install/Update Tomcat](#installupdate-tomcat)
* [Docker](#docker)
  * [Install `docker`](#install-docker)
  * [Update `docker`](#update-docker)
  * [Enable `docker` auto-completion](#enable-docker-auto-completion)
  * [Enable IPv4 forwarding](#enable-ipv4-forwarding)
  * [Enable memory swap](#enable-memory-swap)
  * [Install/Update `docker-compose`](#installupdate-docker-compose)
  * [Enable `docker-compose` auto-completion](#enable-docker-compose-auto-completion)
  * [Install/Update `ctop`](#installupdate-ctop)
* [Kubernetes](#kubernetes)
  * [Install/Update `kubectl`](#installupdate-kubectl)
  * [Enable `kubectl` auto-completion](#enable-kubectl-auto-completion)
  * [Install/Update `minikube`](#installupdate-minikube)
  * [Enable `minikube` auto-completion](#enable-minikube-auto-completion)
  * [Clean `minikube`](#clean-minikube)
  * [Configure `minikube`](#configure-minikube)
  * [Install/Update `helm`](#installupdate-helm)
  * [Enable `helm` auto-completion](#enable-helm-auto-completion)
  * [Install/Update `k9s`](#installupdate-k9s)
<!-- TOC -->

# Git

## Install `git`

https://launchpad.net/~git-core/+archive/ubuntu/ppa
```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

## Install `git-lfs`

https://packagecloud.io/github/git-lfs/install#bash-deb
```bash
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install git-lfs
```

## Configure `git`

https://github.com/settings/emails

Turn on:
* `Keep my email addresses private`
* `Block command line pushes that expose my email`
```bash
git config --global user.name "MarcinPrzygoda"
git config --global user.email "XXXXXXXX+MarcinPrzygoda@users.noreply.github.com"
```

## Configure GitHub token

https://github.com/settings/tokens
```bash
No expiration
Scope: repo, workflow, read:org, gist
```

# SdkMan and dependencies

## Install `sdk`

```bash
sudo chown -R ${USER}:${USER} /opt
export SDKMAN_DIR=/opt/sdkman && curl -s https://get.sdkman.io | bash
```

## Update `sdk`

https://github.com/sdkman/sdkman-cli/releases
```bash
sdk update
```

## Enable `sdk` auto-completion

`gedit ${SDKMAN_DIR}/etc/config`:
```bash
# enable bash or zsh auto-completion
sdkman_auto_complete=true
```

## Configure `sdk`

`gedit ${SDKMAN_DIR}/etc/config`:
* Change `sdkman_colour_enable` from `true` to `false`

## Dependencies

### Install/Update `maven`

https://maven.apache.org/docs/history.html
```bash
sdk list maven
sdk install maven X.X.X
```

### Install/Update `java`

https://www.java.com/releases
```bash
sdk list java
sdk install java X.X.X
```

### Install/Update `spring` - Spring Boot CLI

https://github.com/spring-projects/spring-boot/releases
```bash
sdk list springboot
sdk install springboot X.X.X
```

# IntelliJ IDEA Community

## Install IntelliJ IDEA Community

https://www.jetbrains.com/idea/download/#section=linux
```bash
VERSION="XXXX.X.X"; curl -Lo "ideaIC.tar.gz" "https://download.jetbrains.com/idea/ideaIC-${VERSION}.tar.gz" && mkdir "/opt/intellij-idea" && tar -xzf "ideaIC.tar.gz" --strip-components=1 -C "/opt/intellij-idea" && rm "ideaIC.tar.gz"
```

## Update IntelliJ IDEA Community

`CTRL + SHIFT + ALT + S` -> `SDKs` -> update `JDK home path`

`Help` -> `Check for Updates...`

## Add IntelliJ IDEA Community to dock

`sudo gedit /usr/share/applications/idea.desktop` and add:
```bash
[Desktop Entry]
Type=Application
Name=IntelliJ IDEA
GenericName=IntelliJ IDEA
Comment=The Java IDE for Professional Developers by JetBrains
Icon=/opt/intellij-idea/bin/idea.svg
TryExec=/opt/intellij-idea/bin/idea.sh
Exec=/opt/intellij-idea/bin/idea.sh
Terminal=false
Categories=Development
StartupWMClass=jetbrains-idea-ce
```

## Configure IntelliJ IDEA Community

Open `InteliJ IDEA` -> `Welcome Screen` -> `Options menu` -> `Edit Custom VM Options` and set:
```bash
-Xms1024m
-Xmx2048m
```

# Postman

## Install Postman

```bash
curl -Lo "postman.tar.gz" "https://dl.pstmn.io/download/latest/linux64" && mkdir "/opt/postman" && tar -xzf "postman.tar.gz" --strip-components=1 -C "/opt/postman" && rm -r "postman.tar.gz"
```

## Update Postman

https://www.postman.com/downloads/release-notes
```bash
curl -Lo "postman.tar.gz" "https://dl.pstmn.io/download/latest/linux64" && rm -r "/opt/postman" && mkdir "/opt/postman" && tar -xzf "postman.tar.gz" --strip-components=1 -C "/opt/postman" && rm -r "postman.tar.gz"
```

## Add Postman to dock

`sudo gedit /usr/share/applications/postman.desktop` and add:
```bash
[Desktop Entry]
Type=Application
Name=Postman
GenericName=Postman
Comment=API platform for building and using APIs
Icon=/opt/postman/app/icons/icon_128x128.png
TryExec=/opt/postman/Postman
Exec=/opt/postman/Postman
Terminal=false
Categories=Development
StartupWMClass=postman
```

# Kafka

## Install/Update Kafka

https://github.com/apache/kafka/tags

https://kafka.apache.org/downloads

Download binary and unpack under `/opt/kafka`

# Tomcat

## Install/Update Tomcat

https://github.com/apache/tomcat/tags

https://tomcat.apache.org/download-10.cgi

Download binary and unpack under `/opt/tomcat`

# Docker

## Install `docker`

```bash
curl -s https://get.docker.com | bash
sudo usermod -aG docker "${USER}"
sudo systemctl enable docker && sudo systemctl start docker
sudo chmod 666 /var/run/docker.sock
```

## Update `docker`

https://github.com/moby/moby/releases

Ubuntu Update is enough to update Docker

## Enable `docker` auto-completion

```bash
sudo apt install bash-completion
```
`sudo gedit ~/.bashrc` and add:
```bash
# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi
```
```bash
sudo curl -Lo "/etc/bash_completion.d/docker" "https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker"
```

## Enable IPv4 forwarding

`sudo gedit /etc/sysctl.conf`, uncomment `net.ipv4.ip_forward = 1` and then `sudo service network-manager restart`

## Enable memory swap

`sudo gedit /etc/default/grub` and add ` cgroup_enable=memory swapaccount=1` to `GRUB_CMDLINE_LINUX` and then `sudo update-grub`. Restart VM.

## Install/Update `docker-compose`

https://github.com/docker/compose/releases
```bash
VERSION="X.X.X"; curl -Lo "docker-compose" "https://github.com/docker/compose/releases/download/v${VERSION}/docker-compose-linux-x86_64" && chmod +x ./docker-compose && sudo mv ./docker-compose /usr/local/bin/docker-compose
```

## Enable `docker-compose` auto-completion

V2 does not have completion yet: https://github.com/docker/compose/issues/8550
```bash
VERSION="1.29.2"; sudo curl -Lo "/etc/bash_completion.d/docker-compose" "https://raw.githubusercontent.com/docker/compose/${VERSION}/contrib/completion/bash/docker-compose"
```

## Install/Update `ctop`

https://github.com/bcicen/ctop/releases
```bash
VERSION="X.X.X"; curl -Lo "ctop" "https://github.com/bcicen/ctop/releases/download/${VERSION}/ctop-${VERSION}-linux-amd64" && chmod +x ./ctop && sudo mv ./ctop /usr/local/bin/ctop
```

# Kubernetes

## Install/Update `kubectl`

https://github.com/kubernetes/kubernetes/releases
```bash
VERSION="X.X.X"; curl -Lo "kubectl" "https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/kubectl" && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl
```

## Enable `kubectl` auto-completion

```bash
kubectl completion bash | sudo tee "/etc/bash_completion.d/kubectl"
```

## Install/Update `minikube`

https://github.com/kubernetes/minikube/releases
```bash
VERSION="X.X.X"; curl -Lo "minikube" "https://github.com/kubernetes/minikube/releases/download/v${VERSION}/minikube-linux-amd64" && chmod +x ./minikube && sudo mv ./minikube /usr/local/bin/minikube
```

## Enable `minikube` auto-completion

```bash
minikube completion bash | sudo tee "/etc/bash_completion.d/minikube"
```

## Clean `minikube`

```
minikube delete --all --purge
```

## Configure `minikube`

```bash
minikube config set driver docker
minikube config set kubernetes-version "$(kubectl version --client --short | sed 's/Client Version: v//')"
```

## Install/Update `helm`

https://github.com/helm/helm/releases
```bash
VERSION="X.X.X"; curl -Lo "helm.tar.gz" "https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz" && tar -xzf "helm.tar.gz" "linux-amd64/helm" && rm "helm.tar.gz" && chmod +x ./linux-amd64/helm && sudo mv ./linux-amd64/helm /usr/local/bin/helm && rm -r ./linux-amd64
```

## Enable `helm` auto-completion
```bash
helm completion bash | sudo tee "/etc/bash_completion.d/helm"
```

## Install/Update `k9s`

https://github.com/derailed/k9s/releases
```bash
VERSION="X.X.X"; curl -Lo "k9s.tar.gz" "https://github.com/derailed/k9s/releases/download/v${VERSION}/k9s_Linux_x86_64.tar.gz" && tar -xzf "k9s.tar.gz" "k9s" && rm "k9s.tar.gz" && chmod +x ./k9s && sudo mv ./k9s /usr/local/bin/k9s
```