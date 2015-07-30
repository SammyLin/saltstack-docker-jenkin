jenkins-image:
   docker.pulled:
     - name: jenkins
     - require_in: jenkins-container
 
jenkins-container:
   docker.installed:
     - name: jenkins
     - hostname: jenkins
     - image: jenkins
     - require_in: jenkins
 
jenkins:
   docker.running:
     - container: jenkins
     - image: jenkins
     - ports:
         "8080/tcp":
           HostIp: "0.0.0.0"
           HostPort: "8080"
