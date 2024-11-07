pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'jeeva2407/myimage:latest' // Update the Docker image name to match your repository
    }
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git 'https://github.com/Jeevanantham13/app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    try {
                        docker.build(DOCKER_IMAGE)  // Build the Docker image
                        echo 'Docker image built successfully.'
                    } catch (Exception e) {
                        echo "Docker build failed: ${e.getMessage()}"
                        throw e
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    try {
                        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                            docker.image(DOCKER_IMAGE).push("latest") // Pushing to the updated repository
                            echo 'Docker image pushed to Docker Hub.'
                        }
                    } catch (Exception e) {
                        echo "Docker push failed: ${e.getMessage()}"
                        throw e
                    }
                }
            }
        }
    }
}
