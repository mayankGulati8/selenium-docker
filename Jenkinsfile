pipeline {
    agent any
    stages {
        stage('Build Jar') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Image') {
            steps {
                sh "docker build -t='888777666/selenium-docker' ."
            }
        }
        stage('Push Image') {
                    steps {
        			    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                            //sh
        			        sh "docker login --username=${user} --password=${pass}"
        			        sh "docker push 8888777666/selenium-docker:latest"
        			      }
                 }
               }
            }
        }