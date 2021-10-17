pipeline{
    agent any
    stages{
        stage("Compressing"){
            parallel{
                stage("CleanCSS"){
                    steps{
                        nodejs(nodeJSInstallationName: 'NodeJS'){
                            sh 'cleancss -o www/min/min.css www/css/*.css'
                        }
                    }
                }    
                stage("UglifyJS"){
                    steps{
                        nodejs(nodeJSInstallationName: 'NodeJS'){
                            sh 'uglifyjs -o www/min/min.js www/js/*.js'
                        }
                    }
                }
            }
        }
        stage('Archiving') {
		    steps {
		        sh "tar --exclude=.git --exclude=www/css --exclude=www/js --exclude=archieve.tar.gz -czf archieve.tar.gz ."
		    }
	    }
    }
    post{
		success {
			archiveArtifacts artifacts: 'archieve.tar.gz', fingerprint: true
		}
    }
}
