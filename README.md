# Project 5
# Project Overview
Project 5 seeks to containerize an application or file, automate its deployment with Github actions, and use webhooks to keep production running smoothly 
# Part 1 - Dockerize it
* how to install docker + dependencies
    * Docker Desktop is provided for free on [the website](https://docs.docker.com/desktop/windows/install/). After downloading and running it, the CLI tools are set up. Choosing the httpd image as a base, I had no other dependencies to install. 
* how to build the container
    * `docker build -t [Container Name]:[Tag] [Directory containing dockerfile]`
* how to run the container
    * `docker run -dit --name [container name] -p 8080:80 [image name]`
* how to view the project (open a browser...go to ip and port...)
    * Go to http://localhost:8080 to see the site content given to Apache2

# Part 2 - GitHub Actions and DockerHub
* Create DockerHub public repo
    * [process to create]
* Allow DockerHub authentication via CLI using Dockhub credentials
* Configure GitHub Secrets
    * [what credentials are needed - DockerHub credentials (do not state your credentials)]
    * [set secrets and secret names]
* Configure GitHub Workflow
    * [variables to change (repository, etc.)]

# Part 3 - Deployment
* Creating a webhook

# Extra Credit - DIY
* pick a project and create a docker container
* Document and include:
    * Dockerfile that builds your project and environment
    * Image with your project (link from DockerHub) / docker pull command
    * Instructions to run container from image
