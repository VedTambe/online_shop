pipeline {
    agent {label "dev"};
    
    stages{
        stage("code clone"){
            steps{
                git url : "https://github.com/VedTambe/online_shop.git",branch: "Hackathon"
            }
        }
        stage("code build"){
            steps{
                sh "docker build -t online-shop:latest ."
            }
        }
        stage("push to docker hub"){
            steps{ withCredentials ([usernamePassword(credentialsId:"dockerHubCreds",
            passwordVariable:"dockerHubPass",
            usernameVariable:"dockerHubUser")]){
                
                sh "docker image tag  online-shop:latest ${env.dockerHubUser}/online-shop:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/online-shop:latest"
            
            }
            }
        }
        
        stage("code run"){
            steps{
                sh "docker compose up"
            }
        }
    }
}
post{
        success{
            script{
                emailext from: 'vedanttambe13@gmail.com',
                to: 'vedanttambe13@gmail.com',
                body: 'Build success for Demo CICD App',
                subject: 'Build success for Demo CICD App'
            }
        }
        failure{
            script{
                emailext from: 'vedanttambe13@gmail.com',
                to: 'vedanttambe13@gmail.com',
                body: 'Build Failed for Demo CICD App',
                subject: 'Build Failed for Demo CICD App'
            }
        }
    }
}
