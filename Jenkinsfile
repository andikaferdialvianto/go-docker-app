pipeline {
    agent any

    environment {
        APP_NAME = "go-docker-app"
        REGISTRY_IMAGE = "andikaferdialvianto/go-docker-app:latest"
        SERVER_IP = "38.47.185.5"
        REMOTE_USER = "root"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/andikaferdialvianto/go-docker-app.git'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh '''
                            docker build -t $REGISTRY_IMAGE .
                            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                            docker push $REGISTRY_IMAGE
                            docker logout
                        '''
                    }
                }
            }
        }

        stage('Deploy on Remote Server') {
            steps {
                script {
                    sshagent (credentials: ['vps-ssh']) {
                        sh '''
                            ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${SERVER_IP} "
                                docker stop go-docker-app || true
                                docker rm go-docker-app || true

                                docker pull $REGISTRY_IMAGE

                                docker run -d --name go-docker-app -p 80:8080 $REGISTRY_IMAGE
                            "
                        '''
                    }
                }
            }
        }
    }
}
