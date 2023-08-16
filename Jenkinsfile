pipeline {
  environment {
    registry = "brittanysaic/appfac1_repo"
    registryCredential = 'DockerHub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
        steps {
             git branch: 'main', url: 'https://github.com/utmanbri/Pipeline_BitCoin.git'

        }
    }
    stage('Building image') {
      steps{
          script{
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
      }
    }
    stage('Deploy Image') {
        steps{
            script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
                }
            }
        }
    }
    stage('Remove Unused docker image') {
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
  }
}
