pipeline {
    agent any

    environment {
        // กำหนด environment variables ที่ต้องการใช้
        DOCKER_IMAGE = 'python-api:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // ดึงโค้ดจาก Git repository
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image ด้วย Dockerfile
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        
        stage('Run Docker Compose') {
            steps {
                script {
                    // รัน Docker Compose
                    sh 'docker compose up -d'
                }
            }
        }
    }

    post {
        always {
            // คำสั่งที่ต้องการให้ทำเสมอเมื่อ pipeline เสร็จสิ้น
            cleanWs()
        }

        success {
            // คำสั่งที่ทำเมื่อ pipeline สำเร็จ
            echo 'Pipeline completed successfully!'
        }

        failure {
            // คำสั่งที่ทำเมื่อ pipeline ล้มเหลว
            echo 'Pipeline failed!'
        }
    }
}
