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
        stage('Deploy with Ansible') {
            steps {
                echo 'Deploying....'
                ansiblePlaybook(
                    credentialsId: 'ansible-ssh-edureka',
                    become: true, 
                    becomeUser: 'edureka',
                    inventory: 'ansible-playbook/inventory/hosts',
                    installation:'MyAnsible',
                    limit: 'slave-host',
                    playbook: 'ansible-playbook/deploy-docker.yml',
                    extras: '--extra-var \"lab1_image=tientrung30bkdn/lab1:$BUILD_NUMBER\"'
                )
            }
        }
    }
}