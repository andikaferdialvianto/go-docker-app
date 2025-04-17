pipeline {
    agent any

    environment {
        APP_NAME = "go-docker-app"
        DOCKER_IMAGE = "go-docker-app:latest"
        SERVER_IP = "38.47.185.5"
        REMOTE_USER = "root"
        IMAGE_FILE = "image.tar.gz"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/andikaferdialvianto/go-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        sh "docker build -t $DOCKER_IMAGE ."
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
            }
        }

        stage('Save Docker Image') {
            steps {
                script {
                    try {
                        sh "docker save $DOCKER_IMAGE | gzip > $IMAGE_FILE"
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
            }
        }

        stage('Copy Docker Image to Server') {
            steps {
                script {
                    try {
                        if (!fileExists(IMAGE_FILE)) {
                            error "File $IMAGE_FILE tidak ditemukan setelah build Docker Image"
                        }

                        sshagent (credentials: ['vps-ssh']) {
                            sh """
                                scp -o StrictHostKeyChecking=no $IMAGE_FILE ${REMOTE_USER}@${SERVER_IP}:/tmp/
                            """
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
            }
        }

        stage('Redeploy on Remote Server') {
            steps {
                script {
                    try {
                        sshagent (credentials: ['vps-ssh']) {
                            sh '''
                                ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${SERVER_IP} "
                                    # Stop dan hapus container lama
                                    docker stop go-docker-app || true
                                    docker rm go-docker-app || true

                                    # Load image baru
                                    docker load < /tmp/image.tar.gz

                                    # Jalankan container baru
                                    docker run -d --name go-docker-app -p 80:8080 go-docker-app:latest
                                "
                            '''
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
            }
        }
    }

    post {
        always {
            // Cleanup the image.tar.gz file after deployment
            sh 'rm -f image.tar.gz'
        }
    }
}
