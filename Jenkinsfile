pipeline {
  agent any
  
  stages {
    stage('Initialize'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('Test') {
      agent {
        docker { image 'node:16.13.1-alpine' }
      }
      steps {
        echo "start tests..."
        sh 'sudo RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
          && tar xzvf docker-17.04.0-ce.tgz \
          && mv docker/docker /usr/local/bin \
          && rm -r docker docker-17.04.0-ce.tgz'
        sh 'npm test'
        echo "tests finished..."
        
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
                  color: 'danger',
                  message: "Attention ${currentBuild.fullDisplayName} has failed."
    }
  }
}
