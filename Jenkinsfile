pipeline {
    agent any
    environment {
        DOCKER_USER = "abdelhamed4a"
        DOCKER_IMAGE_NAME = 'jenkins'
        DOCKER_IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_CREDENTIALS_ID = 'Dockerhub'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout Code') {
            steps {
                script {
                    // Checkout the code into the 'Jenkins' directory
                    checkout scm: [
                        $class: 'GitSCM',
                        branches: [[name: '*/main']],  // Specify the branch name (main)
                        doGenerateSubmoduleConfigurations: false,
                        userRemoteConfigs: [
                            [url: 'https://github.com/abdelhamed-4A/Jenkins.git', credentialsId: 'github-jenkins']
                        ]
                    ]
                }    
            }
        }        
        stage('Credentials for Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh '''
                           echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin  
                           '''
                        }
                }
            }
        }
        stage('Build & Tag Docker Image') {
            steps {
                script {
                    // Specify Path of {Dockerfile}
                    sh '''
                    if [ -f Dockerfile ]; then
                        docker build -f Dockerfile -t ${DOCKER_USER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .
                    else
                        echo "ERROR: Dockerfile not found!"
                        exit 1
                    fi
                    '''
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker push ${DOCKER_USER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                // Remove {Old Container} to Run {New Container}
                sh "docker rm -f test_con || true"
                sh "docker run -d --name test_con -p 3030:80 ${DOCKER_USER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
            }
        }
    }
    post {
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed! Check the logs for details.'
        }
    }
}
