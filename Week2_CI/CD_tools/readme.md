# Weekly Assesment 2
## 1.	 Create Jenkins VM with internet access - 1 

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%201.png)

## •	install openjdk-8-jdk, Git 

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%202.png)

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%203.png)
 
## •	install Jenkins with enabling autostart on startup 
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%204.png)

                
## •	setup custom port 8081 for Jenkins 

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%205.png)

##### *Change port value in /etc/default/Jenkins and restart service*
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%206.png)

##### *See ‘address:port’ in ‘add new user’ step*

## •	plugins – select plugins, add GitHub and Role-based authorization strategy 

##### *Also I have installed SSH Build Agents, NodeJS, Pipeline, Multibranch Pipeline and Locale plugins*

## •	add new user – jenkins-NAME (your fullname, jenkins-linustorvalds) 

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%207.png)
 
## 2.	 Create Agent VM - 1 
## •	openjdk-8-jre, Git 
## •	prepare SSH keys 
```sh
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
```
## •	connect agent to master node 
##### *add key from ~/.ssh/id_ed25519.pub to jenskins user’s authorized_keys*
##### *Add credentials in Manage Jenkins – Manage credentials*

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%208.png)

## Add node in Manage Jenkins – Manage Nodes and Clouds

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%209.png)

## Result
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2010.png)

## 3.	Configure tools – NodeJS - 1 
## •	Manage Jenkins -> Global tool configuration 
## •	Add NodeJS installations with version of NodeJS and global npm packages to install (uglify-js, clean-css-cli) 

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2011.png)

## 4.	Create “Multibranch Pipeline” pipeline job (work inside Lab folder) - 3 
## •	folder name – your name in camel case (LinusTorvalds) 
## •	Git: fork https://github.com/joashp/material-design-template repo 
## Write Jenkinsfile which describes declarative pipeline 
## •	define NPM tools in pipeline section 
## •	Run in parallel stages for compressing JS, CSS files by using next utils: 
## •	Uglify-js 
## •	clean-css 
## www/css -> www/min 
## www/js -> www/min 
## •	create tar archive (ignore .git, css and js folders) 
## •	archive result 
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2011.png)
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2012.png)

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2013.png)
 
## 5.	Setup the GitHub webhook to trigger the jobs - 2 
## •	Git plugin - http(s)://JENKINS_URL/git/notifyCommit?url=REPO_URL 
## •	Enable ‘Poll SCM’ in Job settings 
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2014.png)

## •	GitHub plugin - http(s)://JENKINS_URL/github-webhook/ 
## •	Enable ‘GitHub hook trigger for Git SCM polling’ 
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2015.png)

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2016.png)
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2017.png)

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2018.png)

## * Use Scripted pipeline instead of declarative - * 
https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Jenkinsfile_scripted
## * Spin up VM with installed Artifactory - *  
##### *T2.micro too weak to run artifactory*
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2019.png)

##### *Using cloud artifactory*

## * Add new stage for publishing artifacts into Artifactory - * 
 
![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2020.png)

![Image]https://github.com/rkomehdaht/material-design-template/blob/master/Week2_CI/CD_tools/Screenshots/Picture%2021.png)