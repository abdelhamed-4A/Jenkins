pipeline {
    agent any
    stages {
        stage('prep') {
            steps {
                git 'https://github.com/abdelhamed-4A/Jenkins.git'
            }
        }
        stage('ci') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    docker build . -f dockerfile -t abdelhamed4a/jenkins
                    echo \$PASSWORD | docker login -u \$USERNAME --password-stdin
                    docker push abdelhamed4a/jenkins
                    """
                }
            }
        }
        stage('cd') {
            steps {
                sh """
                docker run -d -p 3000:3000 --name node-project abdelhamed4a/jenkins
                """
            }
        }
    }
    post {
        cleanup {
            cleanWs()
        }
    }
}
