#custom Jenkins with docker

FROM openshift/jenkins-2-centos7

USER root

RUN echo "Installing Docker"
RUN whoami
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce
RUN groupadd docker; exit 0
RUN usermod -aG docker jenkins; exit 0
RUN echo "Finished Installing Docker"

USER jenkins
RUN whoami