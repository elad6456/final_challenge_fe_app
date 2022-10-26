pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh '''
                    echo "-----Running build stage npm install-----"
                    DOCKER_BUILDKIT=1 docker build -f Dockerfile_for_pipeline -t nodejs-app --target builder .
                '''
            }
        }
        stage('test') {
            steps {
                sh '''
                    echo "-----Running test stage npm test-----"
                    DOCKER_BUILDKIT=1 docker build -f Dockerfile_for_pipeline -t nodejs-app --target test .
                '''
            }
        }
        stage('start') {
            steps {
                sh '''
                    echo "-----Running delivery stage npm start-----"
                    DOCKER_BUILDKIT=1 docker build -f Dockerfile_for_pipeline -t nodejs-app --target delivery .
                '''
            }
        }
        stage('run') {
            steps {
                sh '''
                    echo "-----Running the docker container-----"
                    docker run -d nodejs-app
                '''
            }
        }
        stage('push-image-to-repo') {
            steps {
                sh '''
                    echo "-----Pushing docker image to repo-----"
                    docker login -u ${username} -p ${pass}
                    docker image tag nodejs-app elad6456/final_challenge_fe_app:jenkins-${BUILD_NUMBER}
                    docker image tag nodejs-app elad6456/final_challenge_fe_app:latest
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
}
