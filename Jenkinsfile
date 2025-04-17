pipeline {
    agent any

    environment {
        APP_NAME = "go-docker-app"
        DOCKER_IMAGE = "go-docker-app"
        SERVER_IP = "38.47.185.5"
        REMOTE_USER = "root"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/andikaferdialvianto/go-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Save Docker Image') {
            steps {
                sh 'docker save $DOCKER_IMAGE | gzip > image.tar.gz'
            }
        }

        stage('Copy Docker Image to Server') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'vps-ssh', keyFileVariable: 'SSH_KEY')]) {
                    sh 'scp -i $SSH_KEY -o StrictHostKeyChecking=no image.tar.gz $REMOTE_USER@$SERVER_IP:/root/'
                }
            }
        }

        stage('Deploy on Remote Server') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'vps-ssh', keyFileVariable: 'SSH_KEY')]) {
                    sh """
                    ssh -i $SSH_KEY -o StrictHostKeyChecking=no $REMOTE_USER@$SERVER_IP <<EOF
                    docker load < image.tar.gz
                    docker rm -f $APP_NAME || true
                    docker run -d --name $APP_NAME -p 80:8080 $DOCKER_IMAGE
                    EOF
                    """
                }
            }
        }
    }

    post {
        always {
            sh 'rm -f image.tar.gz'
        }
    }
}
