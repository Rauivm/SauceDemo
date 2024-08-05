pipeline {
    agent any

    environment {
        ROBOT_REPORTS_DIR = "${WORKSPACE}/logs"
    }

    parameters {
        string(name: 'CHROME_VERSION', defaultValue: 'stable', description: 'Version of Chrome to use')
        string(name: 'CHROMEDRIVER_VERSION', defaultValue: 'canary', description: 'Version of ChromeDriver to use')
    }

    stages {
        stage('Checkout') {
            steps {
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

                    // Instala o Chrome e o ChromeDriver usando @puppeteer/browsers
                    if (isUnix()) {
                        sh """
                            npx @puppeteer/browsers install chrome@${params.CHROME_VERSION}
                            npx @puppeteer/browsers install chromedriver@${params.CHROMEDRIVER_VERSION}
                        """
                    } else {
                        bat """
                            npx @puppeteer/browsers install chrome@${params.CHROME_VERSION}
                            npx @puppeteer/browsers install chromedriver@${params.CHROMEDRIVER_VERSION}
                        """
                    }
                }
            }
        }

        stage('Run Tests') {
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

    post {
        always {
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
