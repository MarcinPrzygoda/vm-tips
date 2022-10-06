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
  * [Install/Update Postman](#installupdate-postman)
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
VERSION="XXXX.X.X"; DIRECTORY="intellij-idea"; curl -Lo "${DIRECTORY}.tar.gz" "https://download.jetbrains.com/idea/ideaIC-${VERSION}.tar.gz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
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

## Install/Update Postman

https://www.postman.com/downloads/release-notes
```bash
DIRECTORY="postman"; curl -Lo "${DIRECTORY}.tar.gz" "https://dl.pstmn.io/download/latest/linux64" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
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

https://kafka.apache.org/downloads

```bash
VERSION="X.X.X"; DIRECTORY="kafka"; curl -Lo "${DIRECTORY}.tar" "https://downloads.apache.org/kafka/${VERSION}/kafka-${VERSION}-src.tgz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xf "${DIRECTORY}.tar" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar"
```

# Tomcat

## Install/Update Tomcat

https://tomcat.apache.org/download-10.cgi

```bash
VERSION="X.X.X"; DIRECTORY="tomcat"; curl -Lo "${DIRECTORY}.tar.gz" "https://dlcdn.apache.org/tomcat/tomcat-10/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

# Docker

## Install `docker`

```bash
# Install
curl -s https://get.docker.com | bash
# Manage Docker as a non-root user
sudo usermod -aG docker "${USER}"
# Run Docker daemon
sudo systemctl enable containerd && sudo systemctl start containerd
sudo systemctl enable docker && sudo systemctl start docker
# Change the permissions of docker socket to be able to connect to the Docker daemon
sudo chmod 666 /var/run/docker.sock
```

https://docs.docker.com/engine/install/linux-postinstall/

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

https://github.com/docker/cli/blob/master/contrib/completion/bash/docker

```bash
VERSION="X.X"; sudo curl -Lo "/etc/bash_completion.d/docker" "https://raw.githubusercontent.com/docker/cli/${VERSION}/contrib/completion/bash/docker"
```

## Enable IPv4 forwarding

`sudo gedit /etc/sysctl.conf`:
* Uncomment `net.ipv4.ip_forward = 1`
* `sudo systemctl restart NetworkManager`

## Enable memory swap

`sudo gedit /etc/default/grub`:
* Add ` cgroup_enable=memory swapaccount=1` to `GRUB_CMDLINE_LINUX` at the end
* `sudo update-grub`
* Restart VM.

## Install/Update `docker-compose`

https://github.com/docker/compose/releases
```bash
VERSION="X.X.X"; BINARY="docker-compose"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/docker/compose/releases/download/v${VERSION}/docker-compose-linux-x86_64" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

## Enable `docker-compose` auto-completion

V2 does not have completion yet: https://github.com/docker/compose/issues/8550
```bash
VERSION="1.29.2"; sudo curl -Lo "/etc/bash_completion.d/docker-compose" "https://raw.githubusercontent.com/docker/compose/${VERSION}/contrib/completion/bash/docker-compose"
```

## Install/Update `ctop`

https://github.com/bcicen/ctop/releases
```bash
VERSION="X.X.X"; BINARY="ctop"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/bcicen/ctop/releases/download/v${VERSION}/ctop-${VERSION}-linux-amd64" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

# Kubernetes

## Install/Update `kubectl`

https://github.com/kubernetes/kubernetes/releases
```bash
VERSION="X.X.X"; BINARY="kubectl"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/kubectl" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

## Enable `kubectl` auto-completion

```bash
kubectl completion bash | sudo tee "/etc/bash_completion.d/kubectl"
```

## Install/Update `minikube`

https://github.com/kubernetes/minikube/releases
```bash
VERSION="X.X.X"; BINARY="minikube"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/kubernetes/minikube/releases/download/v${VERSION}/minikube-linux-amd64" && sudo chmod +x "/usr/local/bin/${BINARY}"
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
minikube config set kubernetes-version "$(kubectl version --client -o yaml | grep -m 1 gitVersion | sed 's/.*gitVersion: v//')"
```

## Install/Update `helm`

https://github.com/helm/helm/releases
```bash
VERSION="X.X.X"; BINARY="helm"; curl -Lo "${BINARY}.tar.gz" "https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz" && sudo tar -xzf "${BINARY}.tar.gz" --strip-components=1 -C "/usr/local/bin" "linux-amd64/${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"
```

## Enable `helm` auto-completion
```bash
helm completion bash | sudo tee "/etc/bash_completion.d/helm"
```

## Install/Update `k9s`

https://github.com/derailed/k9s/releases
```bash
VERSION="X.X.X"; BINARY="k9s"; curl -Lo "${BINARY}.tar.gz" "https://github.com/derailed/k9s/releases/download/v${VERSION}/k9s_Linux_x86_64.tar.gz" && sudo tar -xzf "${BINARY}.tar.gz" -C "/usr/local/bin" "${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"
```