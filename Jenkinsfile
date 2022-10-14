pipeline {
    agent any

    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t tientrung30bkdn/lab1:latest .'
            }
        }
        // stage('Deploy') {
        //     steps {
        //         echo 'Deploying....'
        //     }
        // }
    }
}