FROM alpine:latest as test

COPY SRR5481494_sub_1.fastq.gz .

RUN gunzip SRR5481494_sub_1.fastq.gz
RUN echo "# lines in file:" && wc -l SRR5481494_sub_1.fastq