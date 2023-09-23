FROM ubuntu:latest

RUN apt-get update
RUN apt install wget curl vim mysql-server
