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
                    sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-2) 537672174807.dkr.ecr.us-east-2.amazonaws.com'
                    sh 'docker tag akshayb7/sentiment:latest 537672174807.dkr.ecr.us-east-2.amazonaws.com/sentiment:latest'
                    sh 'docker push 537672174807.dkr.ecr.us-east-2.amazonaws.com/sentiment:latest'
                }
            }
        }
        stage('Create kubernetes cluster') {
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        eksctl create cluster -f cluster.yaml
                    '''    
                }
            }
        }
        /* stage('Delete kubernetes cluster'){
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        eksctl delete cluster -f cluster.yaml
                    '''    
                }
            }
        } */
    }
}
