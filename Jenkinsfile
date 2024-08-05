pipeline {
    agent any

    environment {
        ROBOT_REPORTS_DIR = "${WORKSPACE}/logs"
    }

    parameters {
        string(name: 'CHROMEDRIVER_VERSION', defaultValue: '127.0.6533.88', description: 'Version of ChromeDriver to use')
        booleanParam(name: 'RUN_PARALLEL', defaultValue: false, description: 'Run tests in parallel')
    }

    options {
        timeout(time: 1, unit: 'HOURS')
    }

    triggers {
        cron('H 2 * * *') // Executa o pipeline todos os dias às 2 da manhã
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
                script {
                    // Instala as dependências
                    if (isUnix()) {
                        sh 'pip install -r requirements.txt'
                    } else {
                        bat 'pip install -r requirements.txt'
                    }

                    // Baixa e instala o ChromeDriver
                    def chromedriverUrl = "https://storage.googleapis.com/chrome-for-testing/${params.CHROMEDRIVER_VERSION}/linux64/chromedriver_linux64.zip"
                    if (isUnix()) {
                        sh """
                            wget ${chromedriverUrl}
                            unzip chromedriver_linux64.zip
                            chmod +x chromedriver
                        """
                    } else {
                        bat """
                            curl -LO ${chromedriverUrl}
                            powershell -Command "Expand-Archive chromedriver_linux64.zip"
                            icacls chromedriver /grant Everyone:(RX)
                        """
                    }
                }
            }
        }

        stage('Run Tests') {
            parallel {
                stage('Run BDD Tests') {
                    when {
                        expression { return params.RUN_PARALLEL }
                    }
                    steps {
                        script {
                            if (isUnix()) {
                                sh 'robot -d ${ROBOT_REPORTS_DIR} -v BROWSER:chrome -v OPTIONS:"--headless --no-sandbox --disable-dev-shm-usage" tests/bdd_cases.robot'
                            } else {
                                bat 'robot -d ${ROBOT_REPORTS_DIR} -v BROWSER:chrome -v OPTIONS:"--headless --no-sandbox --disable-dev-shm-usage" tests\\bdd_cases.robot'
                            }
                        }
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
