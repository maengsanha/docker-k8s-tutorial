FROM    golang:1.15.8 AS build

RUN     go get github.com/maengsanha/docker-k8s-tutorial

WORKDIR /go/src/github.com/maengsanha/docker-k8s-tutorial

RUN     make build

EXPOSE  8080

CMD     . /bin/tutorial
