pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clonar o repositório
                git 'https://github.com/Rauivm/SauceDemo.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Instalar dependências
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                // Executar os testes do Robot Framework
                sh 'robot --outputdir results tests/bdd_cases.robot'
            }
        }
    }

    post {
        always {
            // Publicar relatórios do Robot Framework
            robot outputPath: 'results'
        }
        cleanup {
            // Limpar arquivos temporários
            cleanWs()
        }
    }
}
