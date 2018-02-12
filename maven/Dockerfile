FROM maven:3.5.2-jdk-8
WORKDIR /java-sample
COPY maven-hello-world/java-sample /java-sample
RUN apt-get update&&apt-get install apache2 -y
RUN mvn compile&&mvn package
COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
