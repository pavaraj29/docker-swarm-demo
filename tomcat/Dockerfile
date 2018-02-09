FROM tomcat
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
WORKDIR /usr/local/tomcat/bin
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
