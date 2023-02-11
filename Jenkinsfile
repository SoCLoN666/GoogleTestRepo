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
    failure {
      slackSend channel: '#report-ci',
                color: 'RED'
                message: "ATTENTION: @here ${env.JOB_NAME} #${env.BUILD_NUMBER} has failed."
    }
  }
}
