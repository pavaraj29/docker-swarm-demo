pipeline {
    agent any

    environment {
    // Environment variable identifiers need to be both valid bash variable
    // identifiers and valid Groovy variable identifiers. If you use an invalid
    // identifier, you'll get an error at validation time.
    // Right now, you can't do more complicated Groovy expressions or nesting of
    // other env vars in environment variable values, but that will be possible
    // when https://issues.jenkins-ci.org/browse/JENKINS-41748 is merged and
    // released.
        VERSION= "${BUILD_ID}"
        mvn_image= "pavanraj29/maven-sample"
        tomcat_image= "pavanraj29/tomcat-sample"
        stack= "sample-stack"
     }
    
    stages {
        stage("maven build") {
            steps {
                sh '''rm -rf docker-swarm-demo
                      git clone https://github.com/pavaraj29/docker-swarm-demo.git
                      cd docker-swarm-demo/maven
                      sudo docker build -t maven-sample .
                      sed -i -e 's/maven-sample/maven-sample:'${VERSION}'/g' ../sample-stack.yaml
                      sudo docker login -u pavanraj29 -p Pavan@123
                      sudo docker push ${mvn_image}:${VERSION}
                   '''                         
            }
        }
        stage("tomcat build") {
            steps {
              sh '''
                      cd docker-swarm-demo/tomcat
                      sudo docker build -t tomcat-sample .
                      sed -i -e 's/tomcat-sample/tomcat-sample:'${VERSION}'/g' ../sample-stack.yaml
                      sudo docker login -u pavanraj29 -p Pavan@123
                      sudo docker push ${tomcat_image}:${VERSION}
                ''' 
            }
        }
        stage("Docker Stack Deployment") {
            
            steps {
                sh 'sudo docker stack deploy -c sample-stack.yaml sample-stack'
            }
        }
     }  
}
