FROM bioconductor/bioconductor_docker:RELEASE_3_11

RUN R -e "BiocManager::install('HIBAG', update=T, ask=F)"

COPY run_hibag.* /home/
