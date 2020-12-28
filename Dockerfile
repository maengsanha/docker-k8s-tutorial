FROM golang:1.15.6 AS build

WORKDIR /go/src/github.com/maengsanha
RUN go get github.com/maengsanha/docker-k8s-tutorial

WORKDIR /go/src/github.com/maengsanha/docker-k8s-tutorial
RUN make build

###

FROM ubuntu:18.04

COPY --from=build /go/src/github.com/maengsanha/docker-k8s-tutorial/bin/tutorial /bin/

CMD /bin/tutorial
