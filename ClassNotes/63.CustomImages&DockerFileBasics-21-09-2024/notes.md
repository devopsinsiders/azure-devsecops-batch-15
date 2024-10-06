### Dockerfile Notes

A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using `docker build`, users can create an automated build that executes several command-line instructions in succession to create a Docker image.

#### Key Dockerfile Instructions:

1. **FROM**:
   - It defines the base image for subsequent instructions.
   - Every Dockerfile must begin with a `FROM` instruction.
   - Example:
     ```dockerfile
     FROM ubuntu:20.04
     ```

2. **LABEL**:
   - Adds metadata to an image.
   - Example:
     ```dockerfile
     LABEL version="1.0" description="My Docker image"
     ```

3. **RUN**:
   - Executes a command in a new layer on top of the current image and commits the results.
   - Often used to install software packages.
   - Example:
     ```dockerfile
     RUN apt-get update && apt-get install -y nginx
     ```

4. **COPY**:
   - Copies files or directories from the host filesystem to the container’s filesystem.
   - Example:
     ```dockerfile
     COPY ./source /app
     ```

5. **ADD**:
   - Similar to `COPY` but also supports URLs and extracting tar files automatically.
   - Example:
     ```dockerfile
     ADD https://example.com/app.tar.gz /app
     ```

6. **WORKDIR**:
   - Sets the working directory for any `RUN`, `CMD`, `ENTRYPOINT`, `COPY`, and `ADD` instructions that follow it.
   - Example:
     ```dockerfile
     WORKDIR /app
     ```

7. **CMD**:
   - Provides defaults for an executing container. Only one `CMD` instruction is allowed per Dockerfile.
   - Example:
     ```dockerfile
     CMD ["nginx", "-g", "daemon off;"]
     ```

8. **ENTRYPOINT**:
   - Configures a container to run as an executable.
   - Example:
     ```dockerfile
     ENTRYPOINT ["python3"]
     ```

9. **ENV**:
   - Sets environment variables that can be accessed inside the container.
   - Example:
     ```dockerfile
     ENV PORT=8080
     ```

10. **EXPOSE**:
    - Informs Docker that the container listens on the specified network ports at runtime.
    - Example:
      ```dockerfile
      EXPOSE 80
      ```

11. **VOLUME**:
    - Creates a mount point with a specified path and marks it as holding externally mounted volumes.
    - Example:
      ```dockerfile
      VOLUME ["/data"]
      ```

12. **USER**:
    - Specifies the user that will run the container.
    - Example:
      ```dockerfile
      USER nobody
      ```

13. **ARG**:
    - Defines a build-time variable.
    - Example:
      ```dockerfile
      ARG VERSION=1.0
      ```

14. **SHELL**:
    - Changes the default shell used by the `RUN` command.
    - Example:
      ```dockerfile
      SHELL ["/bin/bash", "-c"]
      ```

#### Additional Dockerfile Best Practices:
- Minimize the number of layers by combining commands.
- Use multi-stage builds to optimize the size of your image.
- Always specify exact versions of the base image and any dependencies.

For more details, refer to the official Dockerfile reference documentation:
[Dockerfile Reference](https://docs.docker.com/engine/reference/builder/).