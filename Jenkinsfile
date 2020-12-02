pipeline {
    def APP_NAME = "sample-app"
    def GIT_REPO_NAME = "mrganeshkudale"
    def DEPLOY_ENV = "development"
    agent any
    stages {
        stage('Code Checkout') {
		steps {
	       		sh "if [ -d ${APP_NAME} ]; then rm -rf ${APP_NAME}; fi"
			sh "git clone https://github.com/${GIT_REPO_NAME}/${APP_NAME}.git"
            	}
	}
	stage('Azure Cloud Connect'){
		steps {
	       		sh "az login --identity"
			sh "az account set --subscription aafef7b4-6886-45b4-afeb-2556fc54b425"
               		sh "az aks get-credentials --resource-group atos-tra-pla-rg --name atos-tra-pla-cluster"			
		}
	}
	stage('Build & Image'){
		steps {
			sh "az acr build -r tntaksreg -t ${APP_NAME} ."			
		}
	}
	stage('Deploy'){
		steps {
			sh "kubectl apply -f ${DEPLOY_ENV}.yml"		
		}
	}
    }
}
