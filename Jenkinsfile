pipeline {
	environment {
    		def APP_NAME = "sample"
    		def GIT_REPO_NAME = "mrganeshkudale"
    		def DEPLOY_ENV = "dev"
	}
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
				sh "az account set --subscription xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
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
				sh "kubectl delete deployment ${APP_NAME}-deployment --namespace=${DEPLOY_ENV}"
				sh "kubectl apply -f ${DEPLOY_ENV}.yml --namespace=${DEPLOY_ENV}"
			}
		}
    	}
	post { 
		success { 
		    echo "Your application URL will be - http://${APP_NAME}.e46708b92c054086909b.eastus.aksapp.io"
		}
		failure { 
		    echo "Please check logs for more details."
		}
    	}
}
