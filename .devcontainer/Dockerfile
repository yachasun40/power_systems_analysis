FROM mcr.microsoft.com/devcontainers/python:3.12

RUN apt-get update && \
    apt-get install -y \
        wget \
        curl \
        git \
        unzip \
        build-essential \
        pandoc \
        texlive-latex-base \
        texlive-fonts-recommended \
        texlive-latex-extra \
        texlive-xetex \
        fonts-dejavu && \
    apt-get clean