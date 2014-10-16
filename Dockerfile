# Docker version 1.2.0, build fa7b24f
FROM ubuntu:14.04

# create user
RUN groupadd web
RUN useradd -d /home/bottle -m bottle

# make sure sources are up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install lynx -y

# install pip and hello-world server requirements
RUN apt-get install python-pip -y
ADD / /home/bottle/
RUN pip install bottle

# in case you'd prefer to use links, expose the port
EXPOSE 8080
#ENTRYPOINT ["/usr/bin/python", "/home/bottle/server.py"]
#ENTRYPOINT ["/home/bottle/"]
USER bottle
