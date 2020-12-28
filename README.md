1. [Docker](https://www.docker.com/)

  - install Docker
    
    - on Linux
    ```sh
    sudo apt-get update
    sudo apt-get install curl
    curl -fsSL https://get.docker.com/ | sudo sh
    ```

    - on Mac
    ```sh
    brew install --cask docker
    ```

  - use Docker without `sudo` (optional)
  ```sh
  sudo usermod -aG docker $USER
  ```

  - start and automate Docker (optional)
  ```sh
  sudo systemctl start docker
  sudo systemctl enable docker
  ```

  - check Docker version
  ```sh
  docker version
  ```

  - build Docker image
  ```sh
  docker build -t tutorial .
  ```

  - check Docker image
  ```sh
  docker images
  ```

  - run container
  ```sh
  docker run -d -p 3000:8080 tutorial
  docker run -d -p 3001:8080 tutorial
  docker run -d -p 3002:8080 tutorial
  ```

  - check logs
  ```sh
  docker logs {CONTAINER ID}
  ```



2. [Kubernetes](https://kubernetes.io/)

  - install [minikube](https://minikube.sigs.k8s.io/docs/)
    
    - on Linux
    ```sh
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube-linux-amd64
    mkdir -p /usr/local/bin/
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    ```
       
    - on Mac
    ```sh
    brew install minikube
    ```

  - check minikube version
  ```sh
  minikube version
  ```

  - install [kubectl](https://kubernetes.io/ko/docs/reference/kubectl/overview/)
    
    - on Linux
    ```sh
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/kubectl
    ```
        
    - on Mac
    ```sh
    brew install kubectl
    ```

  - check kubectl version
  ```sh
  kubectl version
  ```

  - start minikube
  ```sh
  minikube start
  ```

  - check cluster status
  ```sh
  kubectl get po -A
  ```

  - check cluster status (dashboard)
  ```sh
  minikube dashboard
  ```

   



- Reference
  - [How to Install Docker on Ubuntu 18.04](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04)
  - [minikube start](https://minikube.sigs.k8s.io/docs/start/)
  - [Install and Set Up kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  - [쿠버네티스 안내서](https://subicura.com/k8s/)
