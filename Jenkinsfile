pipeline {
  agent any
  
  stages {
    stage('Test') {
      steps {
        echo "Testing..."
        
        return 1
      }
    }
  }
  post {
    success {
        slackSend channel: '#report-ci',
                  color: 'good',
                  message: "The pipeline ${currentBuild.fullDisplayName} completed successfully."
    }
  }
}
