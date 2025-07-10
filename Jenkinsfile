pipeline{
    agent any
    environment{
        DOCKER_IMAGE = "pinakdas005/springboot-shopping-cart"
        DOCKER_HUB_CREDENTIALS = "jenkins"
    }
    stages{
        stage('Clonning from github'){
            steps{
                git branch: 'main', url: 'https://github.com/pinak0012025/springbootapplication.git'
            }

        }
        stage ('Buid the application using maven wrapper'){
            steps{
                sh './mvnw clean package -DskipTests'
            }
        }
        stage ('Build Docker Imgae'){
            steps{
                script{
                    dockerImage = docker.build("${DOCKER_IMAGE}")
                }
            }
        }
        stage('Push the Docker Image'){
            steps{
                script{
                    docker.withRegistry('https://index.docker.io/v1/' , "${DOCKER_HUB_CREDENTIALS}"){
                        dockerImage.push("latest")
                }
            }
        }
            
    }
}
}
