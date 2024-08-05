pipeline {
    agent any

    environment {
        ROBOT_REPORTS_DIR = "${WORKSPACE}/logs"
    }

    stages {
        stage('Checkout') {
            steps {
                // Faz o checkout do repositório
                git url: 'https://github.com/Rauivm/SauceDemo', branch: 'main'
            }
        }
        
        stage('Setup') {
            steps {
                // Instalar dependências (supondo que você esteja usando um ambiente Python)
                script {
                    if (isUnix()) {
                        sh 'pip install -r requirements.txt'
                    } else {
                        bat 'pip install -r requirements.txt'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                // Executa os testes Robot Framework
                script {
                    if (isUnix()) {
                        sh 'robot -d ${ROBOT_REPORTS_DIR} tests/bdd_cases.robot'
                    } else {
                        bat 'robot -d ${ROBOT_REPORTS_DIR} tests\\bdd_cases.robot'
                    }
                }
            }
        }
    }

    post {
        always {
            // Publica os relatórios do Robot Framework
            publishHTML([target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'logs',
                reportFiles: 'report.html',
                reportName: 'Robot Framework Report'
            ]])
        }
    }
}
