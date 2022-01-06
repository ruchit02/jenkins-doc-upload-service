pipeline{
    agent any
    tools{
        maven 'Maven 3.8.4'
    }
    stages{
        
        def app
        
        stage('Checkout SCM')"{
            steps{
                
                git branch: 'main', url: 'https://github.com/ruchit02/jenkins-doc-upload-service.git'
                echo 'Repository has been cloned into the current workspace'
            }
        }
    
        stage('Create a JAR file of the source code'){
            steps{
                
                sh 'mvn clean package'
            }
        }
    
        stage('Build the docker image using the dockerfile in the root folder'){
            steps{
                
                app = docker.build("t0pn0tch/photo-image")
            }
        }
    
        stage('Push docker image to dockerhub'){
            steps{
                
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-topnotch') {
                    app.push("latest")
                }
            }
        }
    
        stage('Deploy Pod in local kubernetes cluster'){
            steps{
                
            }
        }
    
        stage('Send Notification'){
            steps{
                
                mail bcc: '',
                     body: 'Hey! Someone just deployed a pod in your kubernetes cluster through jenkins! Kindly checkout whether its an authorized user',
                     cc: 'swethupaturu@gmail.com',
                     from: '',
                     replyTo: 'noreply@gmail.com',
                     subject: 'Pod Deploy Notification',
                     to: 'darjiruchit02@gmail.com'
            }
        }
    }
}
