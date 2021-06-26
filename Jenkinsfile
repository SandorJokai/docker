def dockerfileHome = "/var/jenkins_home/workspace/docker-ampache/ampache-streamer/"
pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git 'https://github.com/SandorJokai/docker'
            }
        }
        stage('build a docker image') {
            steps {
                sh "docker build -t docker-ampache:1.0 ${dockerfileHome}"
            }
        }
        stage('run DB container') {
            steps {
                sh '''docker run -d --name ampache-db -e MYSQL_ROOT_PASSWORD=root\
                -e MYSQL_DATABASE=ampache -e MYSQL_USER=ampache -e MYSQL_PASSWORD=ampache\
                -v /var/lib/mysql:/var/lib/mysql mariadb'''
            }
        }
        stage('run APP container') {
            steps {
                sh '''docker run -d --name ampache -p 80:80 docker-ampache:1.0'''
            }
        }
    }
}

