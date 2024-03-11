var 
pipeline {
    agent {
        label 'jenkins-agent'
    }
    
    stages {
        stage('Deploy Application') {
            steps {
                script {
                    sh "cd /home/ec2-user/Webelight/
                    sh "docker-compose up -d"
                }
            }
        }
        
        stage('Build and Push Docker Images to ECR') {
            steps {
                script {
                    // Authenticate Docker to ECR
                        sh aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin ${ECR_REGISTRY}
                    }

                    // Build and push backend image
                    sh "docker push $ECR_REGISTRY/${ECR_REPOSITORY_BACKEND}:${BUILD_NUMBER}"
                    // Build and push frontend image
                    sh "docker push $ECR_REGISTRY/${ECR_REPOSITORY_FRONTEND}:${BUILD_NUMBER}"
                }
            }
        }
    }
}
