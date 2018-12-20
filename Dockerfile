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
RUN rm /usr/lib/systemd/system/docker.service 
RUN curl -k https://raw.githubusercontent.com/DerBrecher/custom-jenkins/master/docker.service >> /usr/lib/systemd/system/docker.service
RUN echo "Finished Installing Docker"

USER jenkins
RUN whoami