pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'jeeva2407/my-app:latest'
        KUBERNETES_DEPLOYMENT = 'kubernetes/deployment.yaml'
        KUBERNETES_SERVICE = 'kubernetes/service.yaml'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Jeevanantham13/app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Use the 'dockerhub' credentials ID for Docker Hub login
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        docker.image(DOCKER_IMAGE).push("latest")
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f ${KUBERNETES_DEPLOYMENT}"
                    sh "kubectl apply -f ${KUBERNETES_SERVICE}"
                }
            }
        }
    }
}
