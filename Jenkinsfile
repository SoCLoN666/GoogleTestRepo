pipeline {
  agent any
  
  stages {
    stage('Test') {
      steps {
        echo "Testing..."
        
        sleep 5
        error("Build failed because of this and that..")
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
                  color: 'RED',
          message: "Attention ${env.JOB_NAME} #${env.BUILD_NUMBER} has failed."
    }
  }
}
