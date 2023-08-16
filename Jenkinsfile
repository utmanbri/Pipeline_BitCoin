pipeline {
  environment { \\set Credential variables and a dockerimage name variable 
    registry = "brittanysaic/appfac1_repo"
    registryCredential = 'DockerHub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {\\ clone the repo
        steps {
             git branch: 'main', url: 'https://github.com/utmanbri/Pipeline_BitCoin.git' //clone repo

        }
    }
    stage('Building image') { \\ build the image using Dockerfile in the cloned repo
      steps{
          script{
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
      }
    }
    stage('Deploy Image') { \\ deploy image into DockerHub
        steps{
            script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
                }
            }
        }
    }
    stage('Remove Unused docker image') { \\ remove unused image
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
  }
}
