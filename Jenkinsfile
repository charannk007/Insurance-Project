pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
        IMAGE_NAME = 'insurance'
        USER_NAME = 'nkcharan'
        DOCKERHUB_CREDENTIALS = credentials('docker-creds') 
        
      
    }

    stages {
        stage('Clone the GitHub repository') {
            steps {
                git branch: 'insurance', url: 'https://github.com/charannk007/Insurance-Project.git'
            }
        }

        stage('Build the Project') {
            steps {
                script {
                    echo "Maven Home: ${env.MAVEN_HOME}"
                    sh "${MAVEN_HOME}/bin/mvn -version"
                    sh "${MAVEN_HOME}/bin/mvn clean package"
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    }
                }
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:v1 .'
                sh 'docker images'
            }
        }

        stage('Creating the Image') {
            steps {
                sh 'docker tag ${IMAGE_NAME}:v1 ${USER_NAME}/${IMAGE_NAME}:v1'
            }
        }

        stage('Docker Push Image') {
            steps {
                sh 'docker push ${USER_NAME}/${IMAGE_NAME}:v1'
            }
        }

       
    }
    post {
        success {
            echo 'Pipeline completed successfully.'
        }
    }
}