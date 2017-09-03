FROM ubuntu:16.04

RUN apt-get update && apt-get -y install ghostscript && apt-get clean
RUN mkdir /PDFCompressor
COPY compressor.sh /PDFCompressor/
RUN chmod 0755 /PDFCompressor/*.sh
ENV PATH="/PDFCompressor/:${PATH}"
