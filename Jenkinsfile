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
    steps {
      sh 'mvn clean package'
      archiveArtifacts 'target/*.jar'
    }
  }

  stage('Run') {
    steps {
      sh 'java -jar target/petclinic.jar'
    }
  }
}