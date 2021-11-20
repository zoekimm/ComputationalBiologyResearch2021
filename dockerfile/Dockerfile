FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

MAINTAINER Zoe Kim

RUN apt-get update -q
RUN apt-get upgrade -y -q

RUN apt-get install -y \
    curl

RUN curl -LO http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh && bash Miniconda-latest-Linux-x86_64.sh -p /miniconda -b && rm Miniconda-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda
RUN conda config --add channels bioconda
RUN conda install -c bioconda bwa-mem2 
RUN conda install -c bioconda star
RUN conda install "samtools>=1.10"
RUN conda install -c bioconda bwa
