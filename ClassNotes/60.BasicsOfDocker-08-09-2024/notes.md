### Class Notes: Basic Docker Commands

Docker is a platform used to develop, ship, and run applications inside lightweight containers. Containers package up the application code and dependencies, making it easy to move applications between different environments without worrying about inconsistencies.

Here are some of the basic Docker commands used to manage containers, images, and Docker environments.

#### 1. **docker version**
   - **Usage**: `docker version`
   - **Description**: Displays the version of Docker installed on your system, including both client and server versions.

#### 2. **docker pull**
   - **Usage**: `docker pull <image_name>`
   - **Description**: Pulls an image from a Docker registry (e.g., Docker Hub). If the image doesn’t exist locally, Docker downloads it from the registry.
   - **Example**: `docker pull nginx`

#### 3. **docker images**
   - **Usage**: `docker images`
   - **Description**: Lists all the Docker images present on your local machine, showing the repository name, tag, and size.
   
#### 4. **docker run**
   - **Usage**: `docker run <options> <image_name>`
   - **Description**: Runs a Docker container based on an image. The command can include options such as port mapping, volumes, and environment variables.
   - **Common Options**:
     - `-d`: Runs the container in detached mode (in the background).
     - `-p`: Maps host ports to container ports (e.g., `-p 8080:80`).
     - `--name`: Assigns a name to the container.
     - `-it`: Allows you to interact with the container (useful for accessing bash).
   - **Example**: `docker run -d -p 80:80 --name my-nginx nginx`

#### 5. **docker ps**
   - **Usage**: `docker ps`
   - **Description**: Lists all running containers. To list both running and stopped containers, use `docker ps -a`.

#### 6. **docker exec**
   - **Usage**: `docker exec -it <container_name> <command>`
   - **Description**: Executes a command inside a running container. The `-it` option lets you interact with the container, such as running a shell session.
   - **Example**: `docker exec -it my-nginx bash`

#### 7. **docker stop**
   - **Usage**: `docker stop <container_name>`
   - **Description**: Stops a running container by sending a termination signal (SIGTERM). This gives the container time to gracefully shut down.
   - **Example**: `docker stop my-nginx`

#### 8. **docker start**
   - **Usage**: `docker start <container_name>`
   - **Description**: Starts a previously stopped container.
   - **Example**: `docker start my-nginx`

#### 9. **docker rm**
   - **Usage**: `docker rm <container_name>`
   - **Description**: Removes a stopped container. Make sure the container is not running before removing it.
   - **Example**: `docker rm my-nginx`

#### 10. **docker rmi**
   - **Usage**: `docker rmi <image_id>`
   - **Description**: Removes a Docker image from the local machine. Ensure that no running container is using the image before removing it.
   - **Example**: `docker rmi nginx`

#### 11. **docker build**
   - **Usage**: `docker build -t <image_name>:<tag> <path>`
   - **Description**: Builds a Docker image from a Dockerfile. The `-t` option is used to tag the image with a name and tag.
   - **Example**: `docker build -t myapp:latest .`

#### 12. **docker logs**
   - **Usage**: `docker logs <container_name>`
   - **Description**: Fetches and displays logs from a running or stopped container.
   - **Example**: `docker logs my-nginx`

#### 13. **docker network ls**
   - **Usage**: `docker network ls`
   - **Description**: Lists all Docker networks, showing the network name, ID, and type.

#### 14. **docker network create**
   - **Usage**: `docker network create <network_name>`
   - **Description**: Creates a new Docker network, which can be used to enable communication between multiple containers.
   - **Example**: `docker network create my-network`

#### 15. **docker-compose up**
   - **Usage**: `docker-compose up`
   - **Description**: Starts containers based on a `docker-compose.yml` file. This command brings up the entire application defined in the YAML file.
   - **Example**: `docker-compose up -d` (runs in detached mode)

#### 16. **docker-compose down**
   - **Usage**: `docker-compose down`
   - **Description**: Stops and removes the containers defined in the `docker-compose.yml` file.

### Summary of Key Options:
- `-d`: Run in detached mode (background).
- `-p`: Port mapping (host:container).
- `-it`: Interactive terminal (used for commands like bash).
- `--name`: Assigns a name to the container.

### Conclusion:
These basic Docker commands allow you to manage images, containers, networks, and volumes. They provide the foundation for working with Docker to create isolated, reproducible environments for application development and deployment.

