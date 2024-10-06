Here’s a simplified explanation of creating individual Dockerfiles for the React UI, Python backend, and MySQL database without using Docker Compose:

### 1. **React UI Dockerfile**
   - **Objective**: Create a custom Docker image for the todo app's React UI.
   - **Steps**:
     - **Stage 1: Build** – Use the **Node.js** image to install dependencies and build the React app.
     - **Stage 2: Serve** – Use **nginx:alpine** to serve the built static files.

   - **Dockerfile**:
     ```Dockerfile
     # Stage 1: Build React UI
     FROM node:16.20.2 AS tondumal
     WORKDIR /dhondhu
     COPY . .
     RUN npm install  
     RUN npm run build

     # Stage 2: Serve with Nginx
     FROM nginx:alpine
     COPY --from=tondumal /dhondhu/build/ /usr/share/nginx/html/
     ```

   - **Build and Run**:
     1. Build the image:
        ```bash
        docker build -t todo-ui:latest .
        ```
     2. Run the container:
        ```bash
        docker run -d -p 3000:80 todo-ui:latest
        ```
     The UI will be accessible at `http://localhost:3000`.

### 2. **Python Backend Dockerfile**
   - **Objective**: Create a Docker image for the Python backend.
   - **Steps**:
     - Use **Python 3.9** base image.
     - Install required Python packages and run the app using **uvicorn**.

   - **Dockerfile**:
     ```Dockerfile
     FROM python:3.9.20
     WORKDIR /backendapp
     COPY . /backendapp/
     RUN pip install -r requirements.txt
     CMD uvicorn app:app --host 0.0.0.0 --port 8000
     ```

   - **Build and Run**:
     1. Build the image:
        ```bash
        docker build -t todo-backend:latest .
        ```
     2. Run the container:
        ```bash
        docker run -d -p 8000:8000 todo-backend:latest
        ```
     The backend will be accessible at `http://localhost:8000`.

### 3. **MySQL Docker Setup**
   - **Objective**: Run MySQL for the todo app's database.
   - **Steps**:
     - Use the official **MySQL** image and pass environment variables like root password, database, and user credentials.

   - **Run MySQL**:
     ```bash
     docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=rootpass -e MYSQL_DATABASE=todo_db -e MYSQL_USER=todo_user -e MYSQL_PASSWORD=userpass -p 3306:3306 -d mysql:8.0
     ```

   MySQL will be running on port `3306`.