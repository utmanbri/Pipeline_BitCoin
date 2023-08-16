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
        dir(/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin) {
          script{
            dockerImage = docker.build(nginx:stable-alpine3.17-slim)
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
