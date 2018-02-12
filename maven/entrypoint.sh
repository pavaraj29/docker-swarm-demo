#!/bin/bash
sleep 30
curl --upload-file target/webappRunnerSample.war "http://admin1:admin1@sample-stack_tomcat:8080/manager/text/deploy?path=/helloworld&update=true"
apachectl -D FOREGROUND

