#Dockerfile for Ubuntu 18.04 & Oracle Java 8
FROM ubuntu:18.04
MAINTAINER wind_qq <wind_qq@163.com>

RUN apt-get update \
	&& apt-get remove openjdk* \
	&& apt-get install -y \
		openjdk-8-jdk \
	&& rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/local/jdk1.8.0_141
ENV JRE_HOME=${JAVA_HOME}/jre
ENV CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH=${JAVA_HOME}/bin:$PATH