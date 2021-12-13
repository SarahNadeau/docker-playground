FROM alpine:3.14

RUN apk update && apk add \
    curl \
    bash

# Install edirect for e-utilities from the command line
RUN sh -c "$(wget -q ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh -O -)"
ENV PATH=$PATH:/root/edirect

COPY download_fasta.sh /usr/local

RUN mkdir data
WORKDIR data

# Fetch genomes
ENTRYPOINT [ "bash", "/usr/local/download_fasta.sh" ]

# Build with: Docker build -t download-genbank-accessions .
# Run with: docker run -v $PWD:/data --rm download-genbank-accessions