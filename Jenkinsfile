pipeline {
    environment {
        imagename = 'akshayb7/sentiment'
        dockerhubCredentials = 'dockerhub_credentials'
        dockerImage = ''
    }

    agent any
    stages {
        stage('Lint code') {
            steps{
                // sh 'python3 -m pylint --disable=R,C,W1203,W1309,E0611 app/*.py'
                sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    dockerImage = docker.build imagename
                }
            }
        }
        stage('Push docker image to DockerHub') {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: dockerhubCredentials, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
                    sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push imagename
					'''
				    }
                }
            }
        }
    }
}