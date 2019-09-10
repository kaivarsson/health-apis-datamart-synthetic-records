pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '30'))
    disableConcurrentBuilds()
    retry(0)
    timeout(time: 10, unit: 'MINUTES')
    timestamps()
  }
  agent {
    dockerfile {
    }
  }
  environment {
    ENVIRONMENT = "${["staging_lab", "lab"].contains(env.BRANCH_NAME) ? env.BRANCH_NAME.replaceAll('_','-') : "staging-lab"}"
  }
  stages {
    stage('Build') {
      steps {
        withCredentials([
          usernamePassword(
            credentialsId: 'HEALTH_APIS_RELEASES_NEXUS_USERNAME_PASSWORD',
            usernameVariable: 'NEXUS_USERNAME',
            passwordVariable: 'NEXUS_PASSWORD'),
          usernamePassword(
            credentialsId: 'LABMASTER_USERNAME_PASSWORD',
            usernameVariable: 'LABMASTER_USERNAME',
            passwordVariable: 'LABMASTER_PASSWORD'),
          usernamePassword(
            credentialsId: 'LABUSER_USERNAME_PASSWORD',
            usernameVariable: 'LABUSER_USERNAME',
            passwordVariable: 'LABUSER_PASSWORD'),
          usernamePassword(
            credentialsId: 'STGLABMASTER_USERNAME_PASSWORD',
            usernameVariable: 'STGLABMASTER_USERNAME',
            passwordVariable: 'STGLABMASTER_PASSWORD'),
          usernamePassword(
            credentialsId: 'STGLABUSER_USERNAME_PASSWORD',
            usernameVariable: 'STGLABUSER_USERNAME',
            passwordVariable: 'STGLABUSER_PASSWORD'),
         ]) {
          sh script: './build.sh clean'
        }
      }
    }
  }
}