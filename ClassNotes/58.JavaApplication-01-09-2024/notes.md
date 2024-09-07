# Class Notes: Deploying a Java Application on Tomcat Server

## Introduction

Deploying a Java web application involves packaging the application into a WAR (Web Application Archive) file and then deploying it to a servlet container like Apache Tomcat. In this session, we will walk through the steps needed to deploy a Java application using Apache Tomcat, using the `JavaLoginShowcase` project as an example.

## Prerequisites

Before deploying, make sure you have the following tools installed and configured:

1. **Java Development Kit (JDK)**: Required for compiling and running Java applications. Ensure you have JDK 8 or higher.
   - Download from [Oracle's website](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) or use OpenJDK.

2. **Maven**: A build automation tool used for managing project dependencies and packaging the application.
   - Download from [Maven's official website](https://maven.apache.org/download.cgi).

3. **Apache Tomcat**: A web server and servlet container for deploying Java web applications.
   - Download from [Apache Tomcat's website](https://tomcat.apache.org/download-90.cgi).

4. **Git**: Version control system used to clone the repository.
   - Install from [Git's official website](https://git-scm.com/downloads).

## Steps to Deploy a Java Application on Tomcat

### 1. Clone the Repository

Start by cloning the repository that contains the Java application code.

```bash
git clone https://github.com/your-username/JavaLoginShowcase.git
```

Navigate to the project directory:

```bash
cd JavaLoginShowcase
```

### 2. Build the Project

Use Maven to build the project and create a WAR file. The WAR file is the package that will be deployed to Tomcat.

```bash
mvn clean package
```

This command performs the following tasks:
- **`clean`**: Removes any previously compiled files and ensures a fresh build.
- **`package`**: Compiles the code and packages it into a WAR file located in the `target` directory (e.g., `target/JavaLoginShowcase.war`).

### 3. Deploy to Tomcat

To deploy the WAR file to Tomcat, follow these steps:

1. **Copy the WAR file** to Tomcat's `webapps` directory:

   ```bash
   cp target/JavaLoginShowcase.war $TOMCAT_HOME/webapps/
   ```

   Here, `$TOMCAT_HOME` is the directory where Tomcat is installed.

2. **Restart Tomcat** to deploy the application:

   ```bash
   $TOMCAT_HOME/bin/shutdown.sh
   $TOMCAT_HOME/bin/startup.sh
   ```

   - `shutdown.sh` stops the Tomcat server.
   - `startup.sh` starts the Tomcat server and deploys the WAR file.

### 4. Access the Application

Once Tomcat has restarted, you can access your deployed application via a web browser. Navigate to:

```
http://localhost:8080/JavaLoginShowcase
```

Replace `localhost` with your server's IP address or hostname if you're deploying to a remote server.

## Summary

In this session, we covered the process of deploying a Java application on Apache Tomcat. The key steps included cloning the repository, building the project with Maven, deploying the WAR file to Tomcat, and accessing the application via a web browser.

Feel free to reach out with any questions or if you need further clarification on any of the steps. Happy deploying! 🚀