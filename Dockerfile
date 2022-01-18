FROM ubuntu:latest

ENV LANG C.UTF-8


RUN apt update \
     && apt-get install -y wget
     
RUN mkdir -p /node \
    cd node \
    wget https://github.com/cokemine/nodestatus-client-go/releases/latest/download/status-client_linux_amd64.tar.gz \
    tar -zxvf status-client_linux_amd64.tar.gz status-client \
    rm -rf status-client_linux_amd64.tar.gz \
    chmod +x /node/status-client 

WORKDIR /node

CMD ["./status-client"]

