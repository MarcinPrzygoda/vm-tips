#!/bin/bash
# Prints dependency versions installed on the system

#############
# Functions #
#############

main() {
  printSeparator "DOCKER TOOLS"
  printVersion "DOCKER CLIENT" "$(docker version --format '{{.Client.Version}}')"
  printVersion "DOCKER SERVER" "$(docker version --format '{{.Server.Version}}')"
  printVersion "DOCKER-COMPOSE" "$(docker-compose version --short | sed 's/v//')"
  printVersion "CTOP" "$(ctop -v | sed 's/ctop version //;s/, build.*//')"
  printSeparator "KUBERNETES TOOLS"
  printVersion "MINIKUBE" "$(minikube version --short | sed 's/v//')"
  printVersion "MINIKUBE KUBERNETES" "$(minikube config get kubernetes-version)"
  printVersion "KUBECTL" "$(kubectl version --client -o yaml | grep -m 1 gitVersion | sed 's/.*gitVersion: v//')"
  printVersion "K9S" "$(k9s version -s | grep "Version" | sed 's/Version.*v//')"
  printSeparator "OTHER TOOLS"
  printVersion "GIT" "$(git version | sed 's/git version //')"
  printVersion "GIT LFS" "$(git lfs version | sed 's/git-lfs\///;s/ (GitHub.*//')"
  printVersion "INTELIJ IDEA COMMUNITY" "$(cat /opt/intellij-idea/product-info.json | jq '.version' | sed 's/"//g')"
  printVersion "JAVA (Oracle)" "$(java --version | grep 'java.*LTS' | sed 's/java //;s/ .*//')"
#  printVersion "KAFKA" "$(/opt/kafka/bin/kafka-topics.sh --version | sed 's/ .*//')"
#  printVersion "ZOOKEEPER" "$(ls -1 /opt/kafka/libs | grep -m 1 zookeeper | sed 's/zookeeper-//;s/.jar//')"
  printVersion "MAVEN" "$(mvn --version | grep 'Apache Maven' | sed 's/Apache Maven //;s/ .*//')"
  printVersion "POSTMAN" "$(cat /opt/postman/app/resources/app/package.json | grep version | sed 's/.*: //;s/"//g')"
  printVersion "SDKMAN" "${SDKMAN_VERSION}"
  printVersion "SPRING CLI" "$(spring version | sed 's/.*v//')"
  printVersion "TOMCAT" "$(java -cp /opt/tomcat/lib/catalina.jar org.apache.catalina.util.ServerInfo | grep 'Server version' | sed 's/.*\///')"
  printVersion "UBUNTU" "$(cat '/etc/os-release' | grep 'VERSION=' | sed 's/VERSION="//;s/ LTS.*//')"
  printSeparator
}

yellow() {
  echo "\033[1;33m${1}\033[0m"
}

lightGreen() {
  echo "\033[1;32m${1}\033[0m"
}

printSeparator() {
  echo -e "$(yellow '####################################################')"
  if [[ -n "${1}" ]]; then
    printf "$(yellow '#') $(lightGreen '%-48s') $(yellow '#')\n" "${1}"
    echo -e "$(yellow '####################################################')"
  fi
}

printVersion() {
  printf "$(yellow '|') %-25s $(yellow '|') %-20s $(yellow '|')\n" "${1}" "$(echo -e ${2})"
}

###########
# Process #
###########

main