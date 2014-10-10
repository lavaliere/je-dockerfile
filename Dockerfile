FROM stackbrew/ubuntu:14.04
MAINTAINER Tracy Kennedy
#based on aespinosa/jenkins

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://nectar-downloads.cloudbees.com/nectar/war/1.554.10.1/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8888 22 443 7777 8080 9999
CMD [""]