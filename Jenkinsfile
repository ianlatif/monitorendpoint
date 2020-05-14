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
     steps {
        sh 'docker ps'
     }
   }

   stage('Deploy') {
        steps {
            withEnv(["PATH+EXTRA=${HOME}/go/bin"]){
               echo 'Deploying...'
               sh 'go version'
            }
        }
      }
  }
}