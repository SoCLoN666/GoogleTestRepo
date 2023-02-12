pipeline {
  stages {
    agent {
        docker { 
            image 'node:16-alpine' 
            args  '--net="jenkins"'
        }
    }
    stage('Test') {
      steps {
        sh "npm -version"
        sh "npm test"
        echo "tests finished..."
        
        sleep 5
      }
    }
  }
//   post {
//     success {
//         slackSend channel: '#report-ci',
//                   color: 'good',
//                   message: "The pipeline ${currentBuild.fullDisplayName} completed successfully."
//     }
//     failure {
//         slackSend channel: '#report-ci',
//                   color: 'danger',
//                   message: "Attention ${currentBuild.fullDisplayName} has failed."
//     }
//   }
}

