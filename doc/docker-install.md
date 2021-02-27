### [Docker](https://www.docker.com/) installation guide

First, Run `sudo -i` to login as `root`.

- Install Docker
	
	- on Linux (Debian based)
	
	```bash
  apt-get update
  apt-get install curl
  curl -fsSL https://get.docker.com/ | sudo sh
  mkdir -p /etc/systemd/system/docker.service.d
	```
	
	- on Linux (Red Hat based)
	
	```bash
  yum update
  yum install curl
  curl -fsSL https://get.docker.com/ | sudo sh
  mkdir -p /etc/systemd/system/docker.service.d
  ```
	
	- on Mac OS
	
	```bash
  brew install --cask docker
  mkdir -p /etc/systemd/system/docker.service.d
	```

<br>

- Start Docker
	
	```bash
  systemctl start docker
	```
	
	<br>
	
	- to make docker run when startup, run
	
	```bash
  systemctl enable --now docker
	```

	- to use docker without `sudo`, run
	
	```bash
  usermod -aG docker $USER
	```

<br>

- Check Docker version
	
	```bash
  docker version
	```
	
	```bash
	Client: Docker Engine - Community
	 Version:           20.10.3
	 API version:       1.41
	 Go version:        go1.13.15
	 Git commit:        48d30b5
	 Built:             Fri Jan 29 14:33:58 2021
	 OS/Arch:           linux/amd64
	 Context:           default
	 Experimental:      true

	Server: Docker Engine - Community
	 Engine:
	  Version:          20.10.3
	  API version:      1.41 (minimum version 1.12)
	  Go version:       go1.13.15
	  Git commit:       46229ca
	  Built:            Fri Jan 29 14:31:38 2021
	  OS/Arch:          linux/amd64
	  Experimental:     false
	 containerd:
	  Version:          1.4.3
	  GitCommit:        269548fa27e0089a8b8278fc4fc781d7f65a939b
	 runc:
	  Version:          1.0.0-rc92
	  GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
	 docker-init:
	  Version:          0.19.0
	  GitCommit:        de40ad0
	```

<br>

- Clone source codes
	
	```bash
  git clone https://github.com/maengsanha/docker-k8s-tutorial.git
	```

<br>

- Build Docker image
	
	```bash
  docker build -t tutorial .
	```
	
	```bash
	Sending build context to Docker daemon  161.8kB
	Step 1/9 : FROM    golang:1.15.8 AS builder
	1.15.8: Pulling from library/golang
	0ecb575e629c: Pull complete 
	7467d1831b69: Pull complete 
	feab2c490a3c: Pull complete 
	f15a0f46f8c3: Pull complete 
	1517911a35d7: Pull complete 
	7b77ca9fcbe3: Pull complete 
	e49d84fb0a44: Pull complete 
	Digest: sha256:9fdb74150f8d8b07ee4b65a4f00ca007e5ede5481fa06e9fd33710890a624331
	Status: Downloaded newer image for golang:1.15.8
	 ---> 05499cedca62
	Step 2/9 : RUN     go get github.com/maengsanha/docker-k8s-tutorial
	 ---> Running in 13e4a151b827
	Removing intermediate container 13e4a151b827
	 ---> f1dfc90bd437
	Step 3/9 : WORKDIR /go/src/github.com/maengsanha/docker-k8s-tutorial/
	 ---> Running in cef98f4eb710
	Removing intermediate container cef98f4eb710
	 ---> 670aaf94a8c3
	Step 4/9 : RUN     make build
	 ---> Running in b5764f3a0542
	go build -o app .
	go: downloading github.com/gin-gonic/gin v1.6.3
	go: downloading github.com/gin-contrib/sse v0.1.0
	go: downloading github.com/ugorji/go v1.1.7
	go: downloading github.com/golang/protobuf v1.3.3
	go: downloading github.com/mattn/go-isatty v0.0.12
	go: downloading github.com/go-playground/validator/v10 v10.2.0
	go: downloading gopkg.in/yaml.v2 v2.2.8
	go: downloading github.com/ugorji/go/codec v1.1.7
	go: downloading golang.org/x/sys v0.0.0-20200116001909-b77594299b42
	go: downloading github.com/leodido/go-urn v1.2.0
	go: downloading github.com/go-playground/universal-translator v0.17.0
	go: downloading github.com/go-playground/locales v0.13.0
	Removing intermediate container b5764f3a0542
	 ---> e3573e07350c
	Step 5/9 : FROM    fedora:33
	33: Pulling from library/fedora
	3856270ab03a: Pull complete 
	Digest: sha256:3738909921e6d370a5c8dea69951b66af69264ba6b4bc270c856a682d11d5542
	Status: Downloaded newer image for fedora:33
	 ---> 33c4a622f37c
	Step 6/9 : WORKDIR /bin/
	 ---> Running in 603619a66bca
	Removing intermediate container 603619a66bca
	 ---> e508b6bebe4c
	Step 7/9 : COPY    --from=builder /go/src/github.com/maengsanha/docker-k8s-tutorial/app .
	 ---> 240e9a52a33a
	Step 8/9 : EXPOSE  8080
	 ---> Running in db63ea2459e8
	Removing intermediate container db63ea2459e8
	 ---> 100d23b5753f
	Step 9/9 : CMD     ["./app"]
	 ---> Running in 4adfa766443c
	Removing intermediate container 4adfa766443c
	 ---> 866e0b01add7
	Successfully built 866e0b01add7
	Successfully tagged tutorial:latest
	```

- Check Docker image
	
	```bash
  docker images
	```
	
	```bash
	REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
	tutorial     latest    866e0b01add7   3 minutes ago   187MB
	fedora       33        33c4a622f37c   18 hours ago    176MB
	golang       1.15.8    05499cedca62   9 days ago      839MB
	```

<br>

- Run containers
	
	```bash
  docker run --rm -d -p 3000:8080 tutorial
  docker run --rm -d -p 3001:8080 tutorial
  docker run --rm -d -p 3002:8080 tutorial
	```

<br>

- Check containers
	
	```bash
  docker ps
	```
	
	```bash
	CONTAINER ID   IMAGE      COMMAND   CREATED         STATUS         PORTS                    NAMES
	9d6d40e4afb4   tutorial   "./app"   1 second ago    Up 1 second    0.0.0.0:3002->8080/tcp   pensive_williams
	af5c3a8eed6e   tutorial   "./app"   5 seconds ago   Up 4 seconds   0.0.0.0:3001->8080/tcp   wonderful_shamir
	cb9a833a9952   tutorial   "./app"   9 seconds ago   Up 9 seconds   0.0.0.0:3000->8080/tcp   pensive_chaplygin
	```

<br>

- Kill containers
	```bash
  docker kill {container_name}
	```