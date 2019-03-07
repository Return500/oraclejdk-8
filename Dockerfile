#Dockerfile for Ubuntu 18.04 & Oracle Java 8
FROM ubuntu:18.04
MAINTAINER wind_qq <wind_qq@163.com>

RUN apt-get update \
	&& apt-get remove openjdk* \
	&& apt-get install -y wget \
	&& wget --no-cookies --no-check-certificate --header \
		"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; \
		oraclelicense=accept-securebackup-cookie" \
		"http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz" \
	&& tar -zxvf jdk-8u141-linux-x64.tar.gz \
	&& mv jdk1.8.0_141/ /usr/local/ \
	&& rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/local/jdk1.8.0_141
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH