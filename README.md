# Webelight
Code for Deploying Webelight Application

https://github.com/lightyagami17/Webelight

# Setup and Configuration
1. To set up the code, go to a directory and clone this repository.

2. Install Docker and Docker Compose on your machine and make sure they are enabled and working.
   
   The link to install Docker-Compose is given here. Follow the first answer for Amazon Linux OS.

   https://stackoverflow.com/questions/63708035/installing-docker-compose-on-amazon-ec2-linux-2-9kb-docker-compose-file

3. Once it is done, go inside the cloned repository and run the below command

   docker-compose up -d

4. Now after a few minutes, you can see the containers spinning up and ready.

# Webelight Assessment Details

## Jenkins and Docker Setup Details 

1. I used a simple application for this assessment and hence didn't use the AWS RDS service.
  
2. The Dockerfile for the front end is in the frontend directory and for the backend, it is in the backend directory.

3. I have commissioned two EC2 t2.micro instances of 16Gb memory for this assessment. The first server is an Edge or Deployment server where the code will be built and deployed. Here, we will install and configure Docker and Docker Compose software. The name of the Docker Compose file is docker-compose.yml.

4. The other server is the Jenkins Server of the same storage and it is used to host the Jenkins Server. I've installed and configured Jenkins and built two pipelines here, A pipeline job and a FreeStyle Job.

5. The Jenkinsfile is also provided here. In this case, I had to veer off from the traditional approach and tried two implementations. The first one is to use a Pipeline Job and try to deploy it by connecting to the GitHub Repository. There was some issue with the connectivity.

6. The other approach was to use the Edge server or the Deployment Server as a Jenkins Agent and deploy the code and it worked without any hitches.

## AWS Architecture Details

1. I've created an IAM user specifically for this project with Administrator privileges and logged into the console of this newly created user.

2. The whole application is in Mumbai(ap-south-1) region.
  
3. As previously explained, I've used two EC2 instances of AWS Linux 3 type AMI to deploy the application and host CI/CD software.

4. I have used a single security group for both instances. The ports that have been opened are 

   1. 3000, 3001 (Application Ports)

   2. 80, 22 (HTTP, SSH Ports)

   3. 5000, 8080 (Jenkins Agent and Jenkins Ports)
  
   4. Outbound ports are open for all.

5. I've used a static IP for Jenkins VM and if I stop the instance, the IP address will be changed when I restart it.

6. Once Jenkins was set up, I created another user along with the default admin user and worked there.

7. I've installed the necessary plugins in it and created the aforementioned pipelines.

8. Once I've tested the deployment manually and also with the pipeline, I created a private repository in AWS ECR and pushed the image after logging and authentication.

9. There are some issues with the connection to the GitHub Server, hence I couldn't try webhook configuration for autonomous deployment.

10. To overcome this drawback, I've created a shell script at the workspace, which will perform the deployment operation when someone executes this script. This script is also available in the repository.

11. I've created a diagram of the architecture in draw.io and attached it here.
