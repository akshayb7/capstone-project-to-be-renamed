pipeline {
    agent any
    stages {
        stage('Create kubernetes cluster') {
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        eksctl create cluster -f cluster.yaml
                    '''    
                }
            }
        }
        stage('Create Clusters Configuration File') {
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        aws eks --region us-east-2 update-kubeconfig --name sentiment-Cluster
                    '''    
                }
            }
        }
    }
}
