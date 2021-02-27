<img src="https://miro.medium.com/max/4128/1*CO20-3P183ZAqrsJlF7n_A.png">

## Docker & Kubernetes tutorial

- [Docker installation guide](https://github.com/maengsanha/docker-k8s-tutorial/blob/master/doc/docker-install.md)
- [Kubernetes installation guide](https://github.com/maengsanha/docker-k8s-tutorial/blob/master/doc/kubernetes-install.md)

<br>

- After set up Kubernetes, follow as below.

  - Login [Docker Hub](https://hub.docker.com/)
  
  ```bash
  docker login
  ```

  - Build and push image to Docker Hub

  ```bash
  docker build -t {your_name}/tutorial .
  docker push {your_name}/tutorial
  ```

  - Write `app.yaml`

  - Run Kubernetes
  
  ```bash
  kubectl apply -f app.yaml
  ```

  - Monitor Pods

  ```bash
  kubectl describe app
  ```

<br>

- Reference
  - [쿠버네티스 클러스터 구성하기](https://blog.dudaji.com/kubernetes/2019/08/18/k8s-create-cluster.html)
  - [쿠버네티스 안내서](https://subicura.com/k8s/)