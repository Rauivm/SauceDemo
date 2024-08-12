pipeline {
    agent any
    environment {
        PYTHON_PATH = 'C:\\Users\\rauiv\\AppData\\Local\\Programs\\Python\\Python312'
        PIP_PATH = "${env.PYTHON_PATH}\\Scripts"
    }

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
                bat 'pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                // Executar os testes do Robot Framework
                bat 'robot --outputdir results --variable browser:headlesschrome tests/bdd_cases.robot'
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
