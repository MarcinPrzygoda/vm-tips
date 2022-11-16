#!/bin/bash
# Prints dependency versions installed on the system

#############
# Functions #
#############

yellow() {
  echo "\033[1;33m${1}\033[0m"
}

lightGreen() {
  echo "\033[1;32m${1}\033[0m"
}

printSeparator() {
  echo -e "$(yellow "###################################################################################################################")"
  if [[ -n "${1}" ]]; then
    printf "$(yellow "#") $(lightGreen "%-111s") $(yellow "#")\n" "${1}"
    echo -e "$(yellow "###################################################################################################################")"
  fi
}

printVersion() {
  printf "$(yellow "|") %-25s $(yellow "|") %-20s $(yellow "|") %-60s $(yellow "|")\n" "${1}" "$(echo -e "${2}")" "${3}"
}

main() {
  printSeparator "DOCKER TOOLS"
  printVersion "DOCKER CLIENT" "$(docker version --format "{{.Client.Version}}")" "https://github.com/moby/moby/releases"
  printVersion "DOCKER SERVER" "$(docker version --format "{{.Server.Version}}")"
  printVersion "DOCKER-COMPOSE" "$(docker-compose version --short | sed "s/v//")" "https://github.com/docker/compose/releases"
  printVersion "CTOP" "$(ctop -v | sed "s/ctop version //;s/, build.*//")" "https://github.com/bcicen/ctop/releases"
  printSeparator "KUBERNETES TOOLS"
  printVersion "KUBECTL" "$(kubectl version --client -o yaml | grep -m 1 "gitVersion" | sed "s/.*gitVersion: v//")" "https://github.com/kubernetes/kubernetes/releases"
  printVersion "MINIKUBE KUBERNETES" "$(minikube config get kubernetes-version)"
  printVersion "MINIKUBE" "$(minikube version --short | sed "s/v//")" "https://github.com/kubernetes/minikube/releases"
  printVersion "HELM" "$(helm version --template="Version: {{.Version}}" | sed "s/Version: v//")" "https://github.com/helm/helm/releases"
  printVersion "K9S" "$(k9s version -s | grep "Version" | sed "s/Version.*v//")" "https://github.com/derailed/k9s/releases"
  printSeparator "OTHER TOOLS"
  printVersion "GIT" "$(git version | sed "s/git version //")" "https://git-scm.com/downloads"
  printVersion "GIT LFS" "$(git lfs version | sed "s/git-lfs\///;s/ (GitHub.*//")" "https://git-lfs.github.com/"
  printVersion "INTELIJ IDEA COMMUNITY" "$(cat "/opt/intellij-idea/product-info.json" | jq ".version" | sed "s/\"//g")" "https://www.jetbrains.com/idea/download/#section=linux"
  printVersion "VISUAL STUDIO CODE" "$(code -v | head -n 1)" "https://github.com/microsoft/vscode/releases"
  printVersion "JAVA (Oracle)" "$(java --version | grep "java.*LTS" | sed "s/java //;s/ .*//")" "https://www.java.com/releases"
  printVersion "KAFKA" "$(cat "/opt/kafka/gradle.properties" | grep "version=" | sed "s/version=//")" "https://kafka.apache.org/downloads"
  printVersion "MAVEN" "$(mvn --version | grep "Apache Maven" | sed "s/Apache Maven //;s/ .*//")" "https://maven.apache.org/docs/history.html"
  printVersion "POSTMAN" "$(cat "/opt/postman/app/resources/app/package.json" | grep "version" | sed "s/.*: //;s/\"//g")" "https://www.postman.com/downloads/release-notes"
  printVersion "SDKMAN" "${SDKMAN_VERSION}" "https://github.com/sdkman/sdkman-cli/releases"
  printVersion "SPRING CLI" "$(spring version | sed "s/.*v//")" "https://github.com/spring-projects/spring-boot/releases"
  printVersion "TOMCAT" "$(java -cp "/opt/tomcat/lib/catalina.jar" "org.apache.catalina.util.ServerInfo" | grep "Server version" | sed "s/.*\///")" "https://tomcat.apache.org/download-10.cgi"
  printVersion "UBUNTU" "$(cat "/etc/os-release" | grep "VERSION=" | sed "s/VERSION=\"//;s/ LTS.*//")" "https://wiki.ubuntu.com/Releases"
  printSeparator
}

###########
# Process #
###########

main