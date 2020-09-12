pipeline {
    environment {
        dockerhubCredentials = 'dockerhub_credentials'
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
                img = docker.build("sentiment")
            }
        }
    }
}