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
    stage('Deploy Image to dockerhub') {
      steps{
	      sh "docker system prune -af "
	      dockerImage.push("latest")

//           withCredentials([usernamePassword(credentialsId: 'dockerid', passwordVariable: 'dockeridPassword', usernameVariable: 'dockeridUser')]) {
//             sh "docker login -u ${env.dockeridUser} -p ${env.dockeridPassword}"
//             sh 'docker push sharanyajayaram/trialpython:latest'
//           }
      }
    }
    stage('Run the container'){
      steps{
      sh "docker pull sharanyajayaram/trialpython:latest"
      sh "docker run -d -t -p 8000:8000 --name trialcont${BUILD_NUMBER} sharanyajayaram/trialpython:latest"
      sh "‍docker stop --time=60 trialcont${BUILD_NUMBER}"
	    
      }
    }
	  post{
		  success{
			  echo "Container is up and running"
		  }
	  }
          }
      }
