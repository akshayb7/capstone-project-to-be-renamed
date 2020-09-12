pipeline {
    environment {
        imagename = 'akshayb7/sentiment'
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
        stage('Push docker image to ECS') {
            steps { 
                withAWS(region:'us-east-2', credentials:'aws-key'){
                    ecrLogin()
                }
            }
        }
    }
}
