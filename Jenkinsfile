
pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh '''
                    echo "-----Running build stage npm install-----"
                    'DOCKER_BUILDKIT=1 docker build -t nodejs-app:${BUILD_NUMBER} --target builder .
                '''
            }
        }
        stage('test') {
            steps {
                sh '''
                    echo "-----Running test stage npm test-----"
                    DOCKER_BUILDKIT=1 docker build -t nodejs-app:${BUILD_NUMBER} --target test .
                '''
            }
        }
        stage('run') {
            steps {
                sh '''
                    echo "-----Running delivery stage npm start-----"
                    DOCKER_BUILDKIT=1 docker build -t nodejs-app:${BUILD_NUMBER} --target delivery .
                '''
            }
        }
        stage('push-image-to-repo') {
            steps {
                sh '''
                    echo "-----Pushing docker image to repo-----"
                    docker push elad6456/final_challenge_fe_app:${BUILD_NUMBER}
                    docker tag elad6456/final_challenge_fe_app:${BUILD_NUMBER} node-docker:latest
                '''
            }
        }
        stage('cleanup') {
            steps {
                sh '''
                    echo "-----Running docker prune-----"
                    docker system prune -f
                '''
            }
        }
    }
