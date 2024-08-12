pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Rauivm/SauceDemo.git'
            }
        }
        stage('Run Tests') {
            steps {             
                bat """
                    cd C:\\robotframework\\saucedemo\\
                    run.bat
                    """
                //bat 'cd C:\\robotframework\\saucedemo\\run.bat'
            }
        }
    }

    post {
        always {
            // Publicar relatórios do Robot Framework
            robot outputPath: 'results'
            cleanWs() // Limpar arquivos temporários após a execução
        }
    }
}
