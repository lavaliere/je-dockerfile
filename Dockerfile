FROM apemberton/jenkins-enterprise
MAINTAINER Tracy Kennedy

USER root
RUN apt-get update
RUN apt-get -y install git

USER jenkins
EXPOSE 8080 22
ENV JENKINS_HOME /var/lib/jenkins

ENTRYPOINT ["java", "-jar", "jenkins.war", "--httpPort=8080"]
CMD ["--prefix=/jenkins"]