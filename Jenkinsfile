pipeline {
  environment {
    registry = "brittanysaic/appfac1_repo"
    registryCredential = "DockerHub"
    dockerImage = "python:3.12.0rc1-bookworm"
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: "main", url: "https://github.com/utmanbri/Pipeline_BitCoin.git"
      }
    }
    stage('Initialization') {
      steps {
        withEnv(["HOME=${env.WORKSPACE}"])  
            sh 'python -m pip install -r requirements.txt'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t python:3.12.0rc1-bookworm .'
        sh 'python bitcoin-app.py &'
      }
    }
    stage('Run Docker Image') {
      steps { 
        sh 'docker run -d -p 5000:5000 python:3.12.0rc1-bookworm'
      }
    }
    stage('Test Docker Image') {
      steps { 
        sh 'python test.py'
      }
    }  
    stage('Deploy Docker Image') {
      steps {
        sh 'docker push ${registry}:${dockerImage}'
      }
    }
    stage('Remove Unused docker image') {
      steps {
        sh 'docker rmi ${registry}:${BUILD_NUMBER}'
      }
    }
  }
}
