1. [Docker](https://www.docker.com/)

    - install Docker
    ```bash
    sudo apt-get update
    sudo apt-get install curl
    curl -fsSL https://get.docker.com/ | sudo sh
    ```

    - use Docker without `sudo` (optional)
    ```bash
    sudo usermod -aG docker $USER
    ```

    - start and automate Docker (optional)
    ```bash
    sudo systemctl start docker
    sudo systemctl enable docker
    ```

    - check Docker version
    ```bash
    docker version
    ```

    

2. [Kubernetes](https://kubernetes.io/)

    - install [minikube](https://minikube.sigs.k8s.io/docs/)
    ```bash
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube-linux-amd64
    mkdir -p /usr/local/bin/
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    ```

    - check minikube version
    ```bash
    minikube version
    ```

    - install [kubectl](https://kubernetes.io/ko/docs/reference/kubectl/overview/)
    ```bash
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/kubectl
    ```

    - check kubectl version
    ```bash
    kubectl version
    ```

    - start minikube
    ```bash
    minikube start
    ```

    - check cluster status
    ```bash
    kubectl get po -A
    ```

    - check cluster status (dashboard)
    ```bash
    minikube dashboard
    ```

    

    

- Reference
    - [How to Install Docker on Ubuntu 18.04](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04)
    - [minikube start](https://minikube.sigs.k8s.io/docs/start/)
    - [Install and Set Up kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
    - [쿠버네티스 안내서](https://subicura.com/k8s/)