pipeline {
    agent any

    environment {
        deploy_env = "prod"
    }

    tools {
        terraform "tf"
    }

    stages {
        stage('init tf') {
           steps {
               script {
                    echo 'initializing terraform ...'
                    withAWS(credentials: 'aws') {
                        sh 'terraform init -reconfigure'
                        sh "terraform destroy --var-file ${deploy_env}.tfvars -auto-approve"
                    }
               }
           }
       }
    }
}
