pipeline {
   agent any
   stages {
        stage('Build') {
            when { branch 'master' }
            steps {
            echo 'Building...'
            echo "Running ${env.BUILD_ID} ${env.BRANCH_NAME} on ${env.NODE_NAME} and JOB ${env.JOB_NAME}"
            }
        }

        stage('Test') {
            when { branch 'develop' }  
            steps {
                sh 'docker build -t docker.sysadminroot.com/monitorendpoint -f Dockerfile .'
                sh 'docker images' 
            }
        }

        // menjalankan golang dari server local jenkins
        stage('Deploy') { 
            when { branch 'docker' }
            tools { go 'golang' }
            steps {
                withEnv(["PATH+EXTRA=${HOME}/go/bin"]){
                echo 'Deploying... didalam staging'
                sh 'go version'
                }
            }
        }
        
        //runing golang didalam docker 
        stage('docker') {
            when { branch 'docker' }
            agent { docker { image 'golang:1.12-alpine' } }
            steps {
                sh 'go version'
            }
        }
    }
}