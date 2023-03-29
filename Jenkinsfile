node {
  stage('SCM') {
    checkout scm
  }

  stage('SonarQube Analysis') {
    def mvn = tool 'maven';
    withSonarQubeEnv() {
      sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=sonarqube -Dsonar.login=admin -Dsonar.password=123456"
    }
  }

  stage('Build') {
    def mvn = tool 'maven';
    sh "${mvn}/bin/mvn clean package"
    // archiveArtifacts 'target/petclinic.jar'
  }

  stage('Run') {
    sh 'java -Dserver.port=8000 -jar target/spring-petclinic-3.0.0-SNAPSHOT.jar'
  }
}