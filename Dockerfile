#custom Jenkins with docker

FROM openshift/jenkins-2-centos7

USER root



RUN echo "Installing Nodejs"
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - && \
	yum install -y nodejs npm && \
	node -v && \
	npm -v
RUN	npm install -g rollup
RUN	npm install -g rollup-plugin-babel
RUN	npm install -g rollup-plugin-terser
RUN	npm install -g rollup-plugin-progress
RUN npm install --save-dev @babel/core @babel/preset-env
RUN	rollup -v
RUN	npm list -g rollup-plugin-babel
RUN	npm list -g rollup-plugin-terser
RUN	yum install -y rsync
RUN	rsync --version


#RUN whoami
#RUN yum install -y yum-utils device-mapper-persistent-data lvm2
#RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#RUN yum install -y docker-ce
#RUN groupadd docker; exit 0
#RUN usermod -aG docker jenkins; exit 0
#RUN rm /usr/lib/systemd/system/docker.service 
#RUN curl -k https://raw.githubusercontent.com/DerBrecher/custom-jenkins/master/docker.service >> /usr/lib/systemd/system/docker.service
#RUN echo "Finished Installing Docker"

USER jenkins
#RUN whoami