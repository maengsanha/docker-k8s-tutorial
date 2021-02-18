FROM golang:latest AS build

RUN go get github.com/maengsanha/docker-k8s-tutorial

WORKDIR /go/src/github.com/maengsanha/docker-k8s-tutorial

RUN make build

###

FROM alpine:3.13.2

COPY --from=build /go/src/github.com/maengsanha/docker-k8s-tutorial/bin/tutorial /bin

EXPOSE 8080

CMD ./bin/tutorial
