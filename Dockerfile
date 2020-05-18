FROM jenkinsci/slave
USER root
RUN apt update && apt-get -y install apt-transport-https \
                                    ca-certificates \
                                    curl \
                                    gnupg2 \
                                    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce
CMD /etc/init.d/docker start
