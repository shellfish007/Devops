node {
  stage('SCM') {
    checkout scm
  }

  stage('Build') {
    def mvn = tool 'maven';
    sh "${mvn}/bin/mvn clean package"
  }

  stage("execute Ansible") {
    ansiblePlaybook installation: 'Ansible', playbook: 'ansible/petclinic.yml'   
  }
}