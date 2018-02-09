#!/bin/bash
sleep 20
curl --upload-file target/my-app-1.0-SNAPSHOT.jar "http://admin1:admin1@sample-stack_tomcat:8080/manager/text/deploy?path=/sample&update=true"
apachectl -D FOREGROUND

