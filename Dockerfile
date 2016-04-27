FROM jenkins:latest
MAINTAINER bfeng@thoughtworks.com
ENV REFRESHED_AT 2015_4_27

ENV JENKINS_OPTS --httpPort=8080 --prefix=/jenkins

USER root

RUN apt-get update -qq && apt-get install -qqy curl apt-transport-https
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qqy iptables ca-certificates openjdk-7-jdk git-core docker-engine

RUN usermod -aG docker jenkins

EXPOSE 8080

