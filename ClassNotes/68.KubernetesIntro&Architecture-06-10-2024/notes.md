### Kubernetes Basics

Kubernetes, often abbreviated as K8s, is an open-source container orchestration platform designed to automate the deployment, scaling, and management of containerized applications. Originally developed by Google, Kubernetes is now maintained by the Cloud Native Computing Foundation (CNCF).

#### Key Features of Kubernetes:
1. **Automated Rollouts and Rollbacks**: Kubernetes can automatically roll out changes (like updating an application) and roll back updates if something goes wrong.
2. **Self-Healing**: Kubernetes restarts failed containers, replaces containers, and reschedules them when necessary to ensure that the desired state of the application is maintained.
3. **Service Discovery and Load Balancing**: Kubernetes provides a built-in mechanism to discover services and distribute traffic between them, balancing the load efficiently.
4. **Storage Orchestration**: Kubernetes can automatically mount local storage, public cloud storage, or network storage for stateful applications.
5. **Horizontal Scaling**: Applications can be automatically scaled up or down based on traffic or other metrics.
6. **Secrets and Configuration Management**: Kubernetes allows for the management of sensitive information like passwords and API keys without exposing them in the application code.

---

### Kubernetes Architecture

The architecture of Kubernetes is designed with a **master-worker** model, where the control plane (master) manages the cluster, and the worker nodes run the containerized applications. Below is a breakdown of key components:

#### 1. **Master Node (Control Plane)**
   The master node is responsible for managing the Kubernetes cluster, controlling the worker nodes, and ensuring that the desired state of the applications is maintained.

   Key components of the master node include:

   - **API Server (kube-apiserver)**:
     - Acts as the front-end of the Kubernetes control plane.
     - Exposes the Kubernetes API, allowing users and other components to interact with the cluster (e.g., managing nodes, pods, services).
     - Communicates with all other components of the control plane.

   - **Scheduler (kube-scheduler)**:
     - Assigns (schedules) newly created pods to worker nodes based on resource availability and other constraints like affinity/anti-affinity rules, node taints, and tolerations.
     - Ensures efficient use of cluster resources.

   - **Controller Manager (kube-controller-manager)**:
     - Runs a set of controller processes that handle various tasks such as node management, job management, replication, and endpoint updates.
     - The main controllers include:
       - **Node Controller**: Monitors the state of nodes.
       - **Replication Controller**: Ensures the correct number of pod replicas are running.
       - **Endpoint Controller**: Manages service endpoints.
       - **Service Account & Token Controllers**: Create default accounts and tokens for namespaces.

   - **etcd**:
     - A distributed key-value store used to store all cluster data persistently (e.g., cluster state, configurations, secrets).
     - Plays a crucial role in maintaining the overall state of the cluster, and it is the only stateful component of the control plane.

#### 2. **Worker Nodes**

   Worker nodes run the actual containerized applications. Each worker node has its own set of components that communicate with the control plane to ensure application availability and performance.

   Key components of the worker nodes include:

   - **Kubelet**:
     - An agent that runs on each worker node, communicating with the master node.
     - Ensures containers are running in the desired state (e.g., checking the status of pods).
     - Receives pod definitions from the API server and starts the containers.

   - **Kube-proxy**:
     - Responsible for networking in Kubernetes.
     - Implements network rules that allow communication between pods or between external clients and pods.
     - Handles routing for services, allowing for load balancing of traffic.

   - **Container Runtime**:
     - The software responsible for running containers on a node.
     - Kubernetes supports multiple container runtimes such as Docker, containerd, and CRI-O.
     - The container runtime pulls the container images and runs them as containers on the worker node.

#### 3. **Pod**
   - The smallest deployable unit in Kubernetes.
   - A pod can contain one or more containers that share storage, networking, and a specification for how to run the containers.
   - Containers within a pod can communicate with each other using `localhost`, and they share the same network namespace.

#### 4. **Kubernetes Objects**
   - **Namespace**: A logical separation of the cluster into virtual sub-clusters. Used to isolate resources or teams within a Kubernetes cluster.
   - **Service**: An abstraction that defines a logical set of pods and a policy to access them (like load balancing). Services allow communication between pods, other services, or external clients.
   - **Deployment**: Manages the deployment and lifecycle of pods, ensuring that the correct number of pods are running.
   - **ReplicaSet**: Ensures a specified number of pod replicas are running at any given time. It can scale up or down based on requirements.
   - **ConfigMap and Secret**: Provide configuration and sensitive information (like passwords, keys) to applications without embedding them in the container images.
   - **Persistent Volume and Persistent Volume Claim**: Provide durable storage for stateful applications. Persistent Volume (PV) is storage in the cluster, and Persistent Volume Claim (PVC) is a request for storage by a user.

---

### Kubernetes Cluster Workflow

1. **User Interaction**: Users interact with the Kubernetes cluster via the Kubernetes API using the `kubectl` command-line tool or other Kubernetes clients (e.g., dashboards, CI/CD tools).

2. **Pod Creation**: The user defines the application and specifies resources like deployments, services, and volumes. These specifications are sent to the API server.

3. **Scheduling**: The API server passes the pod specifications to the scheduler, which decides on the optimal worker node based on resource availability.

4. **Node Communication**: The control plane components (API server, controller, scheduler) interact with the worker nodes through the Kubelet agent.

5. **Networking**: Kube-proxy on each worker node manages communication between pods across different nodes or between pods and external services.

6. **Execution and Management**: The Kubelet ensures that the containers are running as specified in the pod definition, and the control plane continuously monitors the cluster to maintain the desired state of applications.

---

### Diagram of Kubernetes Architecture

```plaintext
+---------------------+          +---------------------------+
|     Master Node      |          |      Worker Nodes (N)      |
+---------------------+          +---------------------------+
|    API Server        |<-------->|        Kubelet             |
+---------------------+          |---------------------------|
|  Controller Manager  |          |        Kube-proxy          |
+---------------------+          |---------------------------|
|    Scheduler         |          |   Container Runtime (Docker)|
+---------------------+          +---------------------------+
|       etcd           |
+---------------------+
```