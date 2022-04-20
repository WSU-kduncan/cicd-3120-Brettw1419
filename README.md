# Project 5
# Project Overview
Project 5 seeks to containerize an application or file, automate its deployment with Github actions, and use webhooks to keep production and deployment running smoothly 
# Part 1 - Dockerize it
### How to install docker + dependencies
Docker Desktop is provided for free on [the website](https://docs.docker.com/desktop/windows/install/). After downloading and running it, the CLI tools are set up. Choosing the httpd image as a base, I had no other dependencies to install. 
### How to build the container
`docker build -t [Container Name]:[Tag] [Directory containing dockerfile]`
### How to run the container
`docker run -dit --name [container name] -p 8080:80 [image name]`
### How to view the project (open a browser...go to ip and port...)
Go to http://localhost:8080 to see the site content given to Apache2

# Part 2 - GitHub Actions and DockerHub
### Create DockerHub public repo

On [Docker Hub](https://hub.docker.com/repositories), go to the repositories tab and click create repository. Fill in the name and desription of the repository and hit create. 

### How to authenticate with DockerHub via CLI using DockHub credentials

A user can authenticate with DockerHub through a username/password combo OR an authorization token. Tokens are the better option considering that they can be created with certain scope unlike a password which gives total access. To setup an authorization token you go to your account settings and click the security tab. Once there you'll see an area for access tokens. As a free account, you get one access token that cannot be recovered. If you forget to save it, the token must be remade.

When creating an authorization token, click "new access token" and copy the key into a text file so that you don't lose it. Then go to the command line and use the command:

`docker login -u [username]`

Afterwards you will be prompted for your password, or in this case token, so paste it into the terminal.
### Configure GitHub Secrets

For this particular workflow, the docker username and token are required credentials 

To set secrets on github you go to the settings of your repo and click the secrets tab. Once there, you click create new repository secret and it presents you with a field for a name and the value of the secret. For this project I selected my username and token for docker as the secrets named:
    
* DOCKER_USERNAME
    
* DOCKER_TOKEN

### Behavior of GitHub Workflow
    
When there is a push to the GitHub repository, the workflow builds and pushes the docker image to the specified repository on Docker Hub. 
    
Nothing would have to be changed except for the repository name located in the environment variable 'DOCKER_HUB_REPO'. Additionally, one would have to make sure their login credentials are set properly in the GitHub repository secrets. 

# Part 3 - Deployment
### Container restart script
`docker stop [name]`

`docker system prune -f`

`docker pull [DockerHub Username]/[DockerHub Repo]:[Tag]`

`docker run -d --name [name] --rm -p 80:80 [DockerHub Username]/[DockerHub Repo]:[Tag]`

The container restart script ends the container currently running if there is one, removes unused containers, pulls the latest image and then runs it.
### Webhook task definition file

The webhook task definition file is set up to execute the container restart script. This can be seen in the hooks.json file within the repository. 
### Setting up a webhook on the server
Once the server is running, installing the webhook is the next step. I completed this through downloading GO and installing the webhook from GO's package manager. This was done with the following commands:

`wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz` To download the installation files for go.

`sudo tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz` To unzip the archive and place in /usr/local.

`go install github.com/adnang/webhook@latest` To install the webhook with go's package manager

Afterwards I setup the configuration file shown in the last step. Finally to attach the definition file and start the webhook on the server use the command,

`[Path to webhook] -hooks hooks.json -verbose` 

### Setting up a notifier in GitHub or DockerHub

#### DockerHub
Once on DockerHub, go to your repo that you want to connect with your webhook. Once inside, along the navigation for your repo is a tab for webhooks. Here you can give a name and the url your webhook listens on, and the create the webhook on DockerHub. 

The URL used for creation was given in the README for the webhook:

`http://[server]:9000/hooks/redeploy-webhook`

# Part 4 - Diagramming
![Diagram of Continuous Integration/Continuous Deployment](/Diagram.png)