node {
  stage('SCM') {
    checkout scm
  }

  stage('Build') {
    def mvn = tool 'maven';
    sh "${mvn}/bin/mvn clean package"
  }

  stage('Run') {
    sh 'java -Dserver.port=50001 -jar target/spring-petclinic-3.0.0-SNAPSHOT.jar'
  }
}