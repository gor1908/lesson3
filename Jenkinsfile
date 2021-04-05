pipeline {
  environment {
    imagename = "gor1908/lesson3"
    registryCredential = 'dockerhub_id'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/gor1908/lesson3.git', 
	branch:'main'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Deploy') {
      steps{
        sh "docker run --rm -d -p80:9091 gor1908/lesson3:latest"
        sh "date"

      }
    }
  }
}
