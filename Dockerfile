FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /pipeline

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    build-essential \
    ca-certificates \
    gzip \
    unzip \
    openjdk-11-jre \
    python3 \
    python3-pip \
    perl \
    r-base \
    seqtk \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    fastqc \
    trimmomatic

RUN pip3 install multiqc quast

RUN apt-get install -y \
    megahit 

RUN apt-get install -y prodigal

RUN apt-get install -y hmmer

RUN apt-get install -y \
    bowtie2 \
    samtools \
    metabat

RUN pip3 install checkm-genome

RUN apt-get clean

CMD ["/bin/bash"]

