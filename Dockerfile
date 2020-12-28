FROM ubuntu:18.04

RUN apt-get -y update

COPY bin/tutorial /

RUN chmod +x tutorial

EXPOSE 8080

CMD ./tutorial
