pipeline {
    environment {
        imagename = 'akshayb7/sentiment'
        dockerImage = ''
    }

    agent any
    stages {
        stage('Lint code') {
            steps{
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
        stage('Set kubectl context') {
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        kubectl config use-context arn:aws:eks:us-east-2:537672174807:cluster/sentiment-Cluster
                    '''    
                }
            }
        }
        stage('Set Load Balancer service for kubernetes') {
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        kubectl apply -f kubernetes/services.yaml
                    '''    
                }
            }
        }
        stage('Rolling deploy to Kubernetes') {
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        kubectl apply -f kubernetes/deployments.yaml
                    '''    
                }
            }
        }
    }
}