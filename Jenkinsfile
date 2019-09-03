pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '30'))
    disableConcurrentBuilds()
    retry(0)
    timeout(time: 10, unit: 'MINUTES')
    timestamps()
  }
  agent {
    docker {
      image 'flyway/flyway:6.0.1'
    }
  }
  stages {
    stage('Build') {
      withCredentials([
        usernamePassword(
          credentialsId: 'HEALTH_APIS_RELEASES_NEXUS_USERNAME_PASSWORD',
          usernameVariable: 'HEALTH_APIS_RELEASES_NEXUS_USERNAME',
          passwordVariable: 'HEALTH_APIS_RELEASES_NEXUS_PASSWORD'),
        usernamePassword(
          credentialsId: 'VASDVP_RELEASES_NEXUS_USERNAME_PASSWORD',
          usernameVariable: 'VASDVP_RELEASES_NEXUS_USERNAME',
          passwordVariable: 'VASDVP_RELEASES_NEXUS_PASSWORD')
      ]) {
        sh script: build.sh
      }
    }
  }
}