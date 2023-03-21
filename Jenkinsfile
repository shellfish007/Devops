pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvnw clean package'
            }
        }
        stage('Static Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvnw sonar:sonar'
                }
            }
        }
    }
}