#### [Docker](https://www.docker.com/) installation guide

- Install Docker
	- on Linux (Debian based)
	```bash
	$ sudo apt-get update
	$ sudo apt-get install curl
	$ curl -fsSL https://get.docker.com/ | sudo sh
	```
	- on Linux (Red Hat based)
	```bash
	$ sudo yum update
	$ sudo yum install curl
	$ curl -fsSL https://get.docker.com/ | sudo sh
	```
	- on Mac OS
	```bash
	$ brew install --cask docker
	```

<br>

- Start Docker
	```bash
	$ sudo systemctl start docker
	```	
	<br>
	
	- to make docker run when startup, run
	```bash
	$ sudo systemctl enable docker
	```

	- to use docker without `sudo`, run
	```bash
	$ sudo usermod -aG docker $USER
	```

<br>

- Check Docker version
	```bash
	$ docker version
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

- Get source codes
	```bash
	$ git clone https://github.com/maengsanha/docker-k8s-tutorial.git
	```

<br>

- Build Docker image
	```bash
	$ docker build -t tutorial .
	```
	```bash
	Sending build context to Docker daemon  103.4kB
	Step 1/8 : FROM golang:1.15.8 AS build
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
	Step 2/8 : WORKDIR /go/src/github.com/maengsanha
	 ---> Running in 1a942a2bc0f7
	Removing intermediate container 1a942a2bc0f7
	 ---> feba1892f811
	Step 3/8 : RUN go get github.com/maengsanha/docker-k8s-tutorial
	 ---> Running in 703a20c666b0
	Removing intermediate container 703a20c666b0
	 ---> 1768143f01e7
	Step 4/8 : WORKDIR /go/src/github.com/maengsanha/docker-k8s-tutorial
	 ---> Running in a482387aabbb
	Removing intermediate container a482387aabbb
	 ---> 5648c8374d5e
	Step 5/8 : RUN make build
	 ---> Running in 81a07d520d33
	go build -o bin/tutorial -v .
	go: downloading github.com/gin-gonic/gin v1.6.3
	go: downloading github.com/go-playground/validator/v10 v10.2.0
	go: downloading github.com/golang/protobuf v1.3.3
	go: downloading github.com/gin-contrib/sse v0.1.0
	go: downloading github.com/mattn/go-isatty v0.0.12
	go: downloading github.com/ugorji/go v1.1.7
	go: downloading gopkg.in/yaml.v2 v2.2.8
	go: downloading github.com/ugorji/go/codec v1.1.7
	go: downloading github.com/leodido/go-urn v1.2.0
	go: downloading github.com/go-playground/universal-translator v0.17.0
	go: downloading github.com/go-playground/locales v0.13.0
	go: downloading golang.org/x/sys v0.0.0-20200116001909-b77594299b42
	github.com/go-playground/locales/currency
	github.com/go-playground/locales
	github.com/gin-gonic/gin/internal/bytesconv
	github.com/gin-gonic/gin/internal/json
	github.com/gin-contrib/sse
	github.com/leodido/go-urn
	github.com/go-playground/universal-translator
	github.com/golang/protobuf/proto
	github.com/ugorji/go/codec
	gopkg.in/yaml.v2
	github.com/go-playground/validator/v10
	golang.org/x/sys/unix
	github.com/mattn/go-isatty
	github.com/gin-gonic/gin/render
	github.com/gin-gonic/gin/binding
	github.com/gin-gonic/gin
	github.com/maengsanha/docker-k8s-tutorial/middleware/greeter
	github.com/maengsanha/docker-k8s-tutorial
	Removing intermediate container 81a07d520d33
	 ---> b5f5be4f5638
	Step 6/8 : FROM alpine:3.13.2
	3.13.2: Pulling from library/alpine
	ba3557a56b15: Pull complete 
	Digest: sha256:a75afd8b57e7f34e4dad8d65e2c7ba2e1975c795ce1ee22fa34f8cf46f96a3be
	Status: Downloaded newer image for alpine:3.13.2
	 ---> 28f6e2705743
	Step 7/8 : COPY --from=build /go/src/github.com/maengsanha/docker-k8s-tutorial/bin/tutorial /bin/
	 ---> b28ba3d44283
	Step 8/8 : CMD /bin/tutorial
	 ---> Running in 913da5a58943
	Removing intermediate container 913da5a58943
	 ---> af158caf2e29
	Successfully built af158caf2e29
	Successfully tagged tutorial:latest
	```

- Check Docker image
	```bash
	$ docker images
	```
	```bash
	REPOSITORY   TAG       IMAGE ID       CREATED              SIZE
	tutorial     latest    af158caf2e29   About a minute ago   15.7MB
	alpine       3.13.2    28f6e2705743   20 hours ago         5.61MB
	golang       1.15.8    05499cedca62   8 days ago           839MB
	```

<br>

- Run container
	```bash
	$ docker run --rm -d -p 3000:8080 tutorial
	$ docker run --rm -d -p 3001:8080 tutorial
	$ docker run --rm -d -p 3002:8080 tutorial
	```

<br>

- Check containers
	```bash
	$ docker ps
	```
	```bash
	CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
	```