pipeline {
    agent any

    stages {
        stage('Docker Build and Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhubcredentials', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker build -t ${env.dockerHubUser}/lab1:$BUILD_NUMBER ."
                    sh "echo ${env.dockerHubPassword} | docker login -u ${env.dockerHubUser} --password-stdin"
                    sh "docker push ${env.dockerHubUser}/lab1:$BUILD_NUMBER"
                }
            }
        }
        // stage('Deploy') {
        //     steps {
        //         echo 'Deploying....'
        //     }
        // }
    }
}