### Class Notes on `docker exec`

The `docker exec` command is used to run a new command in a running Docker container. This is particularly useful when you need to inspect, troubleshoot, or modify the state of a running container without stopping it. Below are detailed notes on the usage and important aspects of the `docker exec` command:

---

#### **Purpose of `docker exec`:**
- Run additional commands in an already running container.
- Useful for inspecting or troubleshooting containers.
- Allows executing tasks like running bash shells, inspecting logs, or starting additional processes without restarting the container.

---

#### **Basic Syntax:**

```bash
docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
```

- `OPTIONS`: Flags that modify the behavior of the command.
- `CONTAINER`: The name or ID of the container where the command will be executed.
- `COMMAND`: The command you want to run inside the container.
- `ARG...`: Additional arguments required for the command.

---

#### **Common Options:**

1. **`-d, --detach`**:
   - Runs the command in the background.
   - Example: 
     ```bash
     docker exec -d container_name sleep 1000
     ```

2. **`-i, --interactive`**:
   - Keeps STDIN open even if not attached.
   - Used to run commands interactively in the container.
   - Example:
     ```bash
     docker exec -i container_name <command>
     ```

3. **`-t, --tty`**:
   - Allocates a pseudo-TTY.
   - Commonly used with `bash` or `sh` to interact with the container’s shell.
   - Example:
     ```bash
     docker exec -it container_name bash
     ```

4. **`-u, --user`**:
   - Runs the command as a specific user inside the container.
   - Example:
     ```bash
     docker exec -u 1001 container_name <command>
     ```

---

#### **Executing Shell Commands:**

To run a shell session in a container:

```bash
docker exec -it container_name /bin/bash
```

- **`-it`**: Used to run commands interactively in a pseudo-TTY.
- **`/bin/bash`**: Invokes the bash shell in the container. If the container doesn’t have bash installed, you can use `/bin/sh`.

---

#### **Example Scenarios:**

1. **Inspecting Logs**:
   If your application inside the container writes logs to a file, you can inspect them with:
   ```bash
   docker exec -it container_name cat /path/to/logfile.log
   ```

2. **Running Health Check Commands**:
   You can run diagnostics like `ping`, `curl`, or `top` inside the container to check its health:
   ```bash
   docker exec -it container_name curl http://localhost:8080
   ```

3. **Checking Environment Variables**:
   To list environment variables inside a container:
   ```bash
   docker exec -it container_name env
   ```

---

#### **Security Considerations:**

- Running commands inside a container with elevated privileges can be risky. Ensure you are aware of security implications when running commands with `-u root` or other privileged users.

---

#### **Key Differences Between `docker exec` and `docker attach`:**
- **`docker exec`**: Runs a new process inside the container. It does not interfere with the main process running in the container.
- **`docker attach`**: Attaches to the main process in the container. You can interact with the main process but cannot start a new one.

---

#### **Use Cases:**

- **Debugging**: If you need to debug a running container, you can use `docker exec` to get a shell prompt (`bash` or `sh`) and investigate issues.
- **Monitoring**: You can use tools like `top` or `htop` to monitor processes within a container in real-time.
- **Running Database Queries**: If you have a database container, you can use `docker exec` to run SQL commands or inspect the database state.

Example:
```bash
docker exec -it mysql_container mysql -u root -p
```

---

#### **Summary:**

- `docker exec` is a powerful tool to interact with running containers without disrupting their current processes.
- It provides flexibility to run commands, troubleshoot, and make modifications to a container while it is still running.
- Combine it with other options like `-it` and `-u` for better control over how commands are executed.

