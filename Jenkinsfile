pipeline {
  environment {
    registry = "brittanysaic/appfac1_repo"
    registryCredential = 'DockerHub'
    dockerImage = 'nginx:stable-alpine3.17-slim'
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
          sh 'docker build -t nginx:stable-alpine3.17-slim ./docker'
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
