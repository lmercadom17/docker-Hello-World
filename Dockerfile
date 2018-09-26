FROM ubuntu:16.04
MAINTAINER Soo Lee (duplexa@gmail.com)
# This Dockerfile was adapted from the Dockerfile on https://github.com/dvera/shart

# 1. general updates & installing necessary Linux components
RUN apt-get update -y && apt-get install -y \
    bc \
    bzip2 \
    curl \
    g++ \
    git \
    less \
    libbz2-dev \
    libcurl4-openssl-dev \
    liblzma-dev \
    libncurses-dev \
    libssl-dev \
    libtbb-dev \
    littler \
    make \
    man \
    openjdk-8-jre \
    parallel \
    perl \
    python-dev \
    python-pip \
    r-base-dev \
    time \
    unzip \
    vim \
    wget \
    zlib1g-dev \
    libmysqlclient-dev

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install -y git-lfs

WORKDIR /usr/local/bin

# supporting UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# wrapper
COPY script/ .
RUN chmod +x run*.sh

# default command
CMD ["ls","/usr/local/bin/"]

