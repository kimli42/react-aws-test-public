
pipeline { 
    agent any
    options { skipStagesAfterUnstable() }
    
    stages {
        stage("Build") {
            steps {
                sh "npm ci"
                sh "npm run build"
            }
        }
        stage('create aws s3 bucket') {
            steps {
                dir("tf") {
                    sh 'terraform init'
                    sh 'terraform plan -out myplan'
                    sh 'terraform apply -input=false myplan'
                } 
            }
        }
        stage('Upload to s3') {
            steps {
                withAWS(region: 'us-west-2', credentials:'abcd') {
                    s3Upload(bucket:"unique-name", includePathPattern:'**/*');
                }
            }
        }
    }
}
