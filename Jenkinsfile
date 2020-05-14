pipeline {
   agent any

    tools {
        go 'golang'
    }

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

   stage('Deploy') { 
        when { branch 'staging' }
        steps {
            withEnv(["PATH+EXTRA=${HOME}/go/bin"]){
               echo 'Deploying...'
               sh 'go version'
            }
        }
      }
  }
}