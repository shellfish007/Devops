node {
  stage('SCM') {
    checkout scm
  }

  stage('SonarQube Analysis') {
    def mvn = tool 'maven';
    withSonarQubeEnv() {
      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.login=admin -Dsonar.password=admin"
    }
  }

  stage('Run') {
    sh 'java -Dserver.port=50001 -jar target/spring-petclinic-3.0.0-SNAPSHOT.jar'
  }
}