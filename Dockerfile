FROM lavaliere/jenkins-base
MAINTAINER Tracy Kennedy

USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install git vim
RUN printf "AddressFamily inet" >> /etc/ssh/ssh_config 

# Download jenkins.war
USER jenkins
WORKDIR /usr/lib/jenkins
RUN curl -L -O -w "Downloaded: %{url_effective}\\n" "http://nectar-downloads.cloudbees.com/nectar/latest/jenkins.war"

EXPOSE 8080 22 9990 8888 443 33848
ENV JENKINS_HOME /var/lib/jenkins

USER root
ENTRYPOINT ["java", "-jar", "jenkins.war", "--httpPort=8080"]
CMD ["--prefix=/jenkins"]