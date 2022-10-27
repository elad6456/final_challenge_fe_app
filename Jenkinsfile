/*disable printing commands in pipeline build logs*/
def mysh(cmd) {
    sh('#!/bin/sh -e\n' + cmd)
}

pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh '''
                    echo "-----Running build stage npm install-----"
                    DOCKER_BUILDKIT=1 docker build -f Dockerfile_for_pipeline -t elad6456/final_challenge_fe_app --target builder .
                '''
            }
        }
        stage('test') {
            steps {
                sh '''
                    echo "-----Running test stage npm test-----"
                    DOCKER_BUILDKIT=1 docker build -f Dockerfile_for_pipeline -t elad6456/final_challenge_fe_app --target test .
                '''
            }
        }
        stage('start') {
            steps {
                sh '''
                    echo "-----Running delivery stage npm start-----"
                    DOCKER_BUILDKIT=1 docker build -f Dockerfile_for_pipeline -t elad6456/final_challenge_fe_app --target delivery .
                '''
            }
        }
        stage('run') {
            steps {
                sh '''
                    echo "-----Running the docker container-----"
                    docker run -d elad6456/final_challenge_fe_app
                '''
            }
        }
        stage('push-image-to-repo') {
            steps {
                mysh(docker login -u ${username} -p ${pass})
                sh '''
                    echo "-----Pushing docker image to repo-----"
                    docker tag elad6456/final_challenge_fe_app elad6456/final_challenge_fe_app:jenkins-${BUILD_NUMBER}
          
                    docker push elad6456/final_challenge_fe_app --all-tags
                    
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
