pipeline {
    agent any
    stages {
        stage('Lint code') {
            steps{
                sh 'pylint --disable=R,C,W1203,W1309,E0611 app/*.py'
            }
        }
    }
}