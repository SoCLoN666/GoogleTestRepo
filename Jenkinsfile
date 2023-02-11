pipeline {
  agent {
    dockerfile true
  }
  
  stages {
    stage('Test') {
      steps {
        echo "start tests..."
        sh "sudo su -"
        sh "usermod -a -G sudo jenkins"
        sh "sudo groupadd docker"
        sh "sudo usermod -aG docker $USER"
        sh "docker ps"
        sh "npm test"
        echo "tests finished..."
        
        sleep 5
      }
    }
  }
  post {
    success {
        slackSend channel: '#report-ci',
                  color: 'good',
                  message: "The pipeline ${currentBuild.fullDisplayName} completed successfully."
    }
    failure {
        slackSend channel: '#report-ci',
                  color: 'danger',
                  message: "Attention ${currentBuild.fullDisplayName} has failed."
    }
  }
}
