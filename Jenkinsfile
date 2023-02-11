pipeline {
  agent any
  
  stages {
    stage('Test') {
      steps {
        echo "start tests..."
        sh "docker -v"
        sh "usermod -a -G docker jenkins"
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
