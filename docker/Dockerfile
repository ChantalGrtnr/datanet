
FROM rocker/rstudio:latest

LABEL maintainer="frank.krueger@uni-rostock.de"

RUN apt update && apt install -y  \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libglpk-dev \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r tidyverse \ 
                tidygraph \
                ggraph \
                widyr \
                igraph \
                visNetwork \
                writexl

