#!groovy
pipeline {
  agent any
  stages {
    
    stage('Verification') {
       steps {
                sh 'whoami'
                sh 'pwd'
        }
    }

    stage('Maven Install') {
    	    agent {
          	docker {
            	image 'maven:3.6.3'
            }
          }

        steps {
          	sh 'mvn clean install'
          }
      
    }

    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t btformation/spring-petclinic:latest .'
      }
    }

    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'BtFormation',    usernameVariable: 'btformation')]) {
        	sh "docker login -u 'btformation' -p 'BtFormation'"
          sh 'docker push btformation/spring-petclinic:latest'
        }
      }
    }
  }
}
