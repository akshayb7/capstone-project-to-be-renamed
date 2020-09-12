pipeline {
    agent any
    stages {
        stage('Delete kubernetes cluster'){
            steps {
                withAWS(region:'us-east-2', credentials:'aws-key') {
                    sh '''
                        eksctl delete cluster -f cluster.yaml
                    '''    
                }
            }
        } 
    }
}
