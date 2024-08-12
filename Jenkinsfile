pipeline {
    agent any

    environment {
        PYTHON_PATH = 'C:\\Path\\To\\Python'
        PIP_PATH = "${env.PYTHON_PATH}\\Scripts"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Rauivm/SauceDemo.git'
            }
        }
        //stage('Install Dependencies') {
        //    steps {
                // Usar o caminho absoluto para o pip
        //        bat '"${env.PIP_PATH}\\pip.exe" install -r requirements.txt'
        //    }
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
