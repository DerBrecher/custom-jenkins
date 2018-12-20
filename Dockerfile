#custom Jenkins with docker

FROM openshift/jenkins-slave-base-centos7

USER root

RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce
RUN groupadd docker
RUN usermode -aG docker jenkins

USER jenkins