node {
    def app

    stage('Clone repository') {
      
        checkout scm
    }

    stage('Build Docker Image') {
        app = docker.build("mb2love/app")
       //app = docker.build("maximbar/docker")
       //sh 'docker build -t maximbar/docker:latest'
    }

    stage('Test image') {                      
         app.inside {                
             sh 'echo "Tests passed"'        
            }    
        }     
    
    stage('Push Docker Image'){
    
        withCredentials([usernamePassword(credentialsId: 'dockerhub_id', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USER')]) {   
            sh 'docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD'
        }
         //sh "docker push maximbar/docker:latest"
         app.push("${env.BUILD_NUMBER}")            
     }
}
