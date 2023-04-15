node {
  stage('SCM') {
    checkout scm
  }

  stage('Build') {
    def mvn = tool 'maven';
    sh "${mvn}/bin/mvn clean package"
  }

  stage("execute Ansible") {
    ansiblePlaybook installation: 'ansible', credentialsId:'private-key', inventory: 'ansible/hosts.ini', playbook: 'ansible/petclinic.yml'   
  }
}