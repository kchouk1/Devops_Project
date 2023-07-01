pipeline {
    agent any
     environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerHub')
        
        }
  
    stages{
        stage('Clone'){
             steps{  
                 git branch: 'main', url: 'https://github.com/kchouk1/Devops_Project.git'
             }
        }  

      
       stage('MVN CLEAN') {
            steps {
                sh 'mvn clean'
            }
        }

      
        stage('MVN COMPILE') {
            steps {
                   sh 'mvn compile'
                 
            }
        }

      
       stage("Unit tests") {
           steps {
                   sh 'mvn test'
             }
             
        }
        

        
         stage('clean and package') {
            
            steps {
                sh 'mvn clean package'  
            }
     
            } 
                stage('SONARQUBE') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=sonar'
                 
            }
        }

            stage('Nexus'){
            steps{
                sh 'mvn deploy -DskipStaging=true'
            }
        }

              stage("build Docker Image") {
                steps{
                    sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/examen'
                }
        }

        


        
        
    }  // 
}

    
    
     
             
                 
             

    

