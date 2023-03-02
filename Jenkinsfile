pipeline {
  environment {
//     def sonarScanner = tool name: 'shasonar' , type: 'hudson.plugins.sonar.SonarRunnerInstallation'
    imagename = "sharanyajayaram/trialpython"
    dockerImage = ''
  }
  agent any
	options { 
        timestamps ()
        timeout(time: 2, unit: 'MINUTES')   
        skipDefaultCheckout true
        buildDiscarder(logRotator(numToKeepStr: '2'))
    }
  stages {
    stage('Code checkout') {
      steps {
       checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SharanyaJayaram/Basic_signup.git']])
      }
    }
      stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{

          withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
            sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
            sh 'docker push sharanyajayaram/trialpython:latest'
            sh "docker pull sharanyajayaram/trialpython:latest"
	    sh "docker run -d -t -p 8000:8000 --name trialcont${BUILD_NUMBER} sharanyajayaram/trialpython:latest"
          }
      }
    }
  }
}
