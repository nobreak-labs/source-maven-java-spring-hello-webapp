pipeline {
  agent any

  triggers {
    pollSCM('* * * * *')
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', 
        url: 'https://github.com/platina-git/source-maven-java-spring-hello-webapp.git'
      }
    }
    stage('Build') {
      steps {
        sh 'maven clean package'
      }
    }
    stage('Test') {
      steps {
        sh 'la -alh'
      }
    }
    stage('Deploy') {
      steps {
        deploy adapters: [tomcat9(credentialsId: 'tomcat-manager', url: 'http://tomcat-aws:8080')], contextPath: null, war: 'target/hello-world.war'
      }
    }
  }
}
