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
                bat '"${env.PYTHON_PATH}\\Scripts\\robot.exe" --outputdir results --variable browser:headlesschrome tests/bdd_cases.robot'
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
