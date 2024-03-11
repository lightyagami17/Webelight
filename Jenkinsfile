pipeline {
    agent {
        label "jenkins-agent"
    }
    
    stages {
        
        stage('Deploy to Edge Server') {
            steps {
                script {
                    sh 'cd /home/ec2-user/Webelight'
                    sh 'docker-compose.yml up -d'
                }
            }
        }
    }
}
