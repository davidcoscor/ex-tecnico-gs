FROM ubuntu:24.04

### Install Dependencies ###
RUN apt-get update
RUN apt-get install -y \
        git \
        wget \
        bzip2 \
        autoconf \
        automake \
        make \
        gcc \
        perl \
        libwww-perl \
        libjson-perl \
        libarchive-extract-perl \
        libarchive-zip-perl \
        libdbd-mysql-perl \
        libdbi-perl \
        libmodule-build-perl \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        libcurl4-gnutls-dev \
        libssl-dev \
        libncurses5-dev \
        libdeflate-dev \
        fastp \
        fastqc \
        bwa
RUN apt-get clean
WORKDIR /tmp

# samtools & bcftools (as described in https://www.htslib.org/download/)
RUN wget https://github.com/samtools/samtools/releases/download/1.21/samtools-1.21.tar.bz2
RUN tar -xf samtools-1.21.tar.bz2
WORKDIR /tmp/samtools-1.21
RUN ./configure && make && make install
WORKDIR /tmp

RUN wget https://github.com/samtools/bcftools/releases/download/1.21/bcftools-1.21.tar.bz2
RUN tar -xf bcftools-1.21.tar.bz2
WORKDIR /tmp/bcftools-1.21
RUN ./configure && make && make install
WORKDIR /tmp

# VEP (as described in https://www.ensembl.org/info/docs/tools/vep/script/vep_download.html)
RUN git clone https://github.com/Ensembl/ensembl-vep.git
WORKDIR /tmp/ensembl-vep
RUN perl INSTALL.pl --AUTO a

### Cleanup & Copy Files ###
WORKDIR /
RUN rm -r tmp/*

WORKDIR /ex
COPY ./ficheiros_Amostra_A ./ficheiros_Amostra_A
COPY ./src ./src