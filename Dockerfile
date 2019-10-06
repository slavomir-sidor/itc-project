FROM fedora

COPY ./src/fedora/ /
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN dnf -y update && dnf clean all
RUN dnf -y install php tomcat rpmdevtools.noarch openssh-server composer ksh net-tools git-all nmap-ncat mc cmake maven bzip2 make jenkins sonar
RUN dnf -y update && dnf clean all
ENTRYPOINT ["/sbin/init","/bin/bash"] 
