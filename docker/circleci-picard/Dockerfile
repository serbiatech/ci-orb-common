FROM circleci/picard:latest

MAINTAINER Nenad Stefanovic <stefanovic21@sbb.rs>

# SYS: Install required packages

RUN apk update && \
	apk --no-cache upgrade && \
    apk add \
        make \
        bash \
        git