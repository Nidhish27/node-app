pipeline {
    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to build from')
        string(name: 'PORT', defaultValue: '3000', description: 'Application port')
    }

    agent { label 'slave' }

    stages {
        stage('Checkout') {
            steps {
                git branch: params.BRANCH, url: 'https://github.com/Nidhish27/node-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t node-app .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker rm -f node-app || true'
                sh "docker run -d -p ${params.PORT}:3000 --name node-app node-app"
            }
        }
    }
}
