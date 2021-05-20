pipeline {
  agent any
  stages {
    stage('Set permissions') {
      steps {
        sh 'sudo chmod -R 777 $WORKSPACE'
      }
    }
    stage('Distill render') {
      steps {
        sh 'echo $WORKSPACE'
        sh 'ls'
        sh 'pwd'
        sh '$WORKSPACE/bin/distill_build.sh'
        //sh 'sudo -E $WORKSPACE/bin/distill_build.sh'
      }
    }
    stage('Deploy to github') {
      steps {
        // delete existing container, run new one
        sh 'git -C $WORKSPACE add .'
        sh 'git -C $WORKSPACE commit -m "[ci-skip]"'
        sh 'git -C $WORKSPACE push origin HEAD:master'
      }
    }
  }
}