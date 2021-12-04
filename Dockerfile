FROM ubuntu:latest

LABEL "Author"="Martins Tararujs"

ARG APIMATION_VERSION=0.54.8
ENV VERSION=${APIMATION_VERSION}


RUN apt update && apt upgrade
RUN apt install -y curl

RUN apt install wget
RUN apt install unzip

WORKDIR /usr/src/apimation
RUN wget https://github.com/apimation/cli-client/releases/download/v${APIMATION_VERSION}/apimation_${APIMATION_VERSION}_linux_amd64.zip
RUN unzip apimation_${APIMATION_VERSION}_linux_amd64.zip
RUN rm apimation_${APIMATION_VERSION}_linux_amd64.zip

ENTRYPOINT [ "./apimation" ]