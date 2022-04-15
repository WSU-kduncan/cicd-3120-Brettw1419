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

    On [Docker Hub](https://hub.docker.com/repositories), go to the repositories tab and click create repository. Fill in the name and desription of the repository and hit create. 

* How to authenticate with DockerHub via CLI using DockHub credentials

    A user can authenticate with DockerHub through a username/password combo OR an authorization token. Tokens are the better option considering that they can be created with certain scope unlike a password which gives total access. To setup an authorization token you go to your account settings and click the security tab. Once there you'll see an area for access tokens. As a free account, you get one access token that cannot be recovered. If you forget to save it, the token must be remade.

    When creating an authorization token, click "new access token" and copy the key into a text file so that you don't lose it. Then go to the command line and use the command:

    `docker login -u [username]`

    Afterwards you will be prompted for your password, or in this case token, so paste it into the terminal.
* Configure GitHub Secrets

    For this particular workflow, the docker username and password are required credentials 

    To set secrets on github you go to the settings of your repo and click the secrets tab. Once there, you click create new repository secret and it presents you with a field for a name and the value of the secret. For this project I selected my username and password for docker as the secrets named:
    
    DOCKER_USERNAME
    
    DOCKER_PASSWORD


* Behavior of GitHub Workflow
    
    what does it do and when

    When the repository is pushed, the workflow creates the image from part 1 on dockerhub
    
    [variables to change (repository, etc.)]

# Part 3 - Deployment
* Container restart script
    * what it does
* Webhook task definition file
    * what it does
* Setting up a webhook on the server
    * how you created your own listener 
    * how you installed and are running the webhook on Github
* Setting up a notifier in GitHub or DockerHub

# Part 4 - Diagramming
