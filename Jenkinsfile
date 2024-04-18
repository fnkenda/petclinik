#!groovy
pipeline {
  agent any
  stages {
    
    // stage('Verification') {
    //    steps {
    //             sh 'whoami'
    //             sh 'pwd'
    //     }
    // }

    stage('Maven Install') {
    	    agent {
          	docker {
            	image 'maven:3.5.0'
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
      	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DevOps2024',    usernameVariable: 'ddragueur')]) {
        	sh "docker login -u 'ddragueur' -p 'DevOps2024'"
          sh 'docker push ddragueur/spring-petclinic:latest'
        }
      }
    }
  }
}
