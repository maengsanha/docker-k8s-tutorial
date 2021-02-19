FROM    golang:1.15.8 AS builder
RUN     go get github.com/maengsanha/docker-k8s-tutorial
WORKDIR /go/src/github.com/maengsanha/docker-k8s-tutorial/
RUN     make build

FROM    fedora:33
WORKDIR /bin/
COPY    --from=builder /go/src/github.com/maengsanha/docker-k8s-tutorial/app .
EXPOSE  8080
CMD     ["./app"]
