pipeline {
  environment {
    registry = "brittanysaic/appfac1_repo"
    registryCredential = 'DockerHub'
    dockerImage = 'python:3.12.0rc1-bookworm'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'main', url: 'https://github.com/utmanbri/Pipeline_BitCoin.git'
      }
    }
    stage('Building image') {
      steps {
        script {  
          //dockerImage = docker.build('python:3.12.0rc1-bookworm')
          sh 'bitcoin-app.py &'
        }
      }
    }
    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry("brittanysaic/appfac1_repo", registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps {
        sh "docker rmi '${registry}:${BUILD_NUMBER}'"
      }
    }
  }
}
