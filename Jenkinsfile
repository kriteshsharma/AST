pipeline{
    agent any

    environment{
        DOCKERHUB_CREDENTIALS = credentials('docker-cred')
        DOCKER_REPO="krsharma/ast-ci-cd:${BUILD_NUMBER}" 

    }
    stages {
        stage('checkout'){
            steps{
                git branch: 'main', url: "https://github.com/kriteshsharma/AST.git"
            }
        }

        stage('Image Building'){
            steps{
                sh '''
                echo bulding docker image
                docker build -t ${DOCKER_REPO} .
                '''
            }
        }

        stage('Run container'){
            steps{
                docker.image('your-image-name:tag').run('-p 8000:8000 -it')
            }
        }

    }


}