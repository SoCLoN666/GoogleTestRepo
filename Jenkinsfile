pipeline {
  agent {
        docker { image 'node:16.13.1-alpine' }
    }
  
  stages {
    stage('Test') {
      steps {
        echo "start tests..."
        sh "usermod -a -G docker jenkins"
        sh "reboot"
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
