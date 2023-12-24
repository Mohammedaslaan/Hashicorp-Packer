pipeline {
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
    stages {
        stage('Fetch Packer Files') {
            steps {
                // Clone the Terraform files from Git
                git branch: 'main', url: 'https://github.com/Mohammedaslaan/Hashicorp-Packer.git'
            }
        }
        stage('Execute Packer') {
            steps {
                sh "packer init ."
                sh 'packer validate .'
                sh 'packer inspect .'
                sh 'packer build .'
            }
        }
        
    }

  }
