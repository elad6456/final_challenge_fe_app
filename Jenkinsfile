
pipeline {
    agent any

    stages {
        stage('Pre-build stg') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target pre-build .'
            }
        }
        stage('build') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target build .'
            }
        }
        stage('test') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target test .'
            }
        }
        stage('security') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target security .'
            }
        }
        stage('backend') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target back-end .'
            }
        }
        stage('front-end') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t elad:latest --target front-end .'
            }
        }
        stage('push-image') {
            steps {
                sh 'docker push elad6456/final_challenge_fe_app:1.0'
            }
        }
        stage('cleanup') {
            steps {
                sh 'docker system prune -f'
            }
        }
    }
