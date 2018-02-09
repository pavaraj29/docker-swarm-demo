FROM maven:3.5.2-jdk-8
WORKDIR /my-app
COPY maven-hello-world/my-app /my-app
RUN apt-get update&&apt-get install apache2 -y
RUN mvn compile&&mvn package
#CMD curl --upload-file target/my-app-1.0-SNAPSHOT.jar "http://admin1:admin1@sample-stack_tomcat:8080/manager/text/deploy?path=/sample&update=true"
#CMD apachectl -D FOREGROUND
COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
