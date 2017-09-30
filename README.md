# Jocker-Swarm
The aim of the project is to provide a mantainable environment to build Jenkins jobs in a reproducible way, using Docker containers.
## Env file
The file `env.list` contains the environment variables needed to connect to the Jenkins master.

* `HOST` : server URL where Jenkins master is running (e.g: http://myjenkins.com:8080)
* `USER` : username to access Jenkins
* `PASSWORD` : user password

## Run the container
We assume to have built a docker image called `swarm-client` with the provided Dockerfile.

Once set up the environment variables, run the following command:

`docker run --net=host --env-file env.list --name myswarm swarm-client`
